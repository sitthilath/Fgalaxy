import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/domain/repository/banners_repository.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/state/banner_state.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/paginated_response.dart';
import 'package:galaxy_18_lottery_app/shared/exceptions/http_exception.dart';

class BannerNotifier extends StateNotifier<BannerState> {
  final BannersRepository repository;

  BannerNotifier({required this.repository})
      : super(const BannerState.initial());

  Future<void> fetchAllBanners() async {
    state = state.copyWith(
      state: BannerConcreteState.loading,
      isLoading: true,
    );
    final response = await repository.fetchAllBanners();
    updateStateFromResponse(response);
  }

  void updateStateFromResponse(
      Either<AppException, PaginatedResponse> response) {
    response.fold((failure) {
      state = state.copyWith(
        state: BannerConcreteState.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      final bannerList = data.data.map((json) => Banner.fromJson(json)).toList();
      state = state.copyWith(
        state: BannerConcreteState.loaded,
        bannerList: bannerList,
        hasData: bannerList.isNotEmpty,
        message: bannerList.isEmpty? 'ບໍ່ມີແບຣນເນີ້':'',
        isLoading: false,
      );
    });
  }
  void resetState(){
    state = const BannerState.initial();
  }
}
