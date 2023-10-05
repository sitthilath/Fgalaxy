import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/information/domain/repository/information_repository.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/providers/state/information_state.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/infomation/information_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/messaging.dart';

class InformationNotifier extends StateNotifier<InformationState> {
  final InformationRepository repository;

  InformationNotifier({required this.repository})
      : super(const InformationState.initial());

  bool get isFetching =>
      state.state != InformationConcreteState.loading &&
      state.state != InformationConcreteState.fetchingMore;

  Future<void> fetchAllInformation() async {
    if (isFetching &&
        state.state != InformationConcreteState.fetchedAll) {
      state = state.copyWith(
        state: state.cursor > 0
            ? InformationConcreteState.fetchingMore
            : InformationConcreteState.loading,
        isLoading: true,
      );
      final response = await repository.fetchInformation(cursor: state.cursor);
      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: InformationConcreteState.fetchedAll,
        isLoading: false,
        message: Messaging.FETCHED_ALL_MESSAGE,
      );
    }
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: InformationConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final informationList =
          data.data.map((item) => Information.fromJson(item)).toList();
      final informationTotal = [...state.informationList, ...informationList];
      final lastCursor =
          informationTotal.isNotEmpty ? informationTotal.last.id : 0;
      state = state.copyWith(
        informationList: informationTotal,
        cursor: lastCursor,
        state: data.data.isNotEmpty
            ? InformationConcreteState.loaded
            : InformationConcreteState.fetchedAll,
        hasData: true,
        message: informationTotal.isNotEmpty? '': Messaging.NOT_FOUND_DATA,
        isLoading: false,
      );
    });
  }

  void resetState(){
    state = const InformationState.initial();
  }
}
