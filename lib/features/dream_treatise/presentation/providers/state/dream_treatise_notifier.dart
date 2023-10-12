import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/domain/repository/dream_treatise_repository.dart';
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/providers/state/dream_treatise_state.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';
import 'package:galaxy_18_lottery_app/shared/utils/messaging.dart';

class DreamTreatiseNotifier extends StateNotifier<DreamTreatiseState> {
  final DreamTreatiseRepository repository;

  DreamTreatiseNotifier(this.repository) : super(const DreamTreatiseState.initial());

  bool get isFetching =>
      state.state != DreamTreatiseConcreteState.loading &&
      state.state != DreamTreatiseConcreteState.fetchingMore;

  Future<void> fetchAllDreamTreatise() async {
    if (isFetching &&
        state.state != DreamTreatiseConcreteState.fetchedAllDreamTreatise) {
      state = state.copyWith(
        state: state.cursor > 0
            ? DreamTreatiseConcreteState.fetchingMore
            : DreamTreatiseConcreteState.loading,
        isLoading: true,
      );

      final response =
          await repository.fetchAllDreamTreatises(cursor: state.cursor);
      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: DreamTreatiseConcreteState.fetchedAllDreamTreatise,
        message: Messaging.FETCHED_ALL_MESSAGE,
        isLoading: false,
      );
    }
  }

  Future<void> searchDreamTreatise({required String query}) async {
    if (isFetching &&
        state.state != DreamTreatiseConcreteState.fetchedAllDreamTreatise) {
      state = state.copyWith(
        state: state.cursor > 0
            ? DreamTreatiseConcreteState.fetchingMore
            : DreamTreatiseConcreteState.loading,
        isLoading: true,
      );
      final response = await repository.searchDreamTreatises(
          cursor: state.cursor, query: query);
      updateStateFromResponse(response);
    } else {
      state = state.copyWith(
        state: DreamTreatiseConcreteState.fetchedAllDreamTreatise,
        message: Messaging.FETCHED_ALL_MESSAGE,
        isLoading: false,
      );
    }
  }

  Future<void> fetchOneDreamTreatise({required int id}) async {
    state = state.copyWith(
      state: DreamTreatiseConcreteState.loading,
      isLoading: true,
    );
      final response = await repository.fetchOneDreamTreatise(id: id);
      response.fold((failure) {
        state = state.copyWith(
          state: DreamTreatiseConcreteState.failure,
          message: failure.message,
          isLoading: false,
        );
      }, (data) {
        state = state.copyWith(
          state: DreamTreatiseConcreteState.loaded,
          hasDreamTreatise: true,
          dreamTreatise: data,
          isLoading: false,
          message: '',
        );
      });
    }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: DreamTreatiseConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final dreamTreatises =
          data.data.map((json) => DreamTreatise.fromJson(json)).toList();
      final dreamTreatisesTotal = [
        ...state.dreamTreatisesList,
        ...dreamTreatises
      ];
      final lastCursor =
          dreamTreatisesTotal.isNotEmpty ? dreamTreatisesTotal.last.id : 0;
      state = state.copyWith(
        dreamTreatisesList: dreamTreatisesTotal,
        hasDreamTreatise: dreamTreatisesTotal.isNotEmpty,
        cursor: lastCursor,
        state: data.data.isNotEmpty
            ? DreamTreatiseConcreteState.loaded
            : DreamTreatiseConcreteState.fetchedAllDreamTreatise,
        isLoading: false,
        message: dreamTreatisesTotal.isNotEmpty ? Messaging.FETCHED_ALL_MESSAGE : Messaging.NOT_FOUND_DATA,
      );
    });
  }

  void resetState() {
    state = const DreamTreatiseState.initial();
  }
}
