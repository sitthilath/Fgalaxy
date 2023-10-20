import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/domain/repository/current_draw_lottery_repository.dart';
import 'package:galaxy_18_lottery_app/features/current_draw_tottery/presentation/providers/state/current_draw_lottery_state.dart';
import 'package:galaxy_18_lottery_app/services/current_draw_lottery_cache_service/domain/repository/current_draw_lottery_cache_repository.dart';

class CurrentDrawLotteryNotifier extends StateNotifier<CurrentDrawLotteryState>{
  final CurrentDrawLotteryRepository repository;
  final CurrentDrawLotteryCacheRepository cacheRepository;
  CurrentDrawLotteryNotifier({required this.repository, required this.cacheRepository}): super(const CurrentDrawLotteryState.initial());

  Future<bool> get hasCurrentDrawLotto async => (await cacheRepository.checkCurrentDrawLottery());

  Future<void> getCurrentDrawLotto() async {
    state = state.copyWith(
      state: CurrentDrawLotteryConcreteState.loading,
      isLoading: true,
    );
    if(await hasCurrentDrawLotto){
      await _getCurrentDrawLottoCache();
      return;
    }
    _fetchCurrentDrawLottoFromAPi();
  }

  _getCurrentDrawLottoCache() async {
    final result = await cacheRepository.fetchCurrentDrawLottery();
    result.fold((failure){
      state = state.copyWith(
        state: CurrentDrawLotteryConcreteState.failure,
        isLoading: false,
        message: failure.message,
      );
    }, (data){
      state = state.copyWith(
        state: CurrentDrawLotteryConcreteState.loaded,
        currentDrawLottery: data,
        isLoading: false,
        message: '',
      );
    });
  }

  void _fetchCurrentDrawLottoFromAPi() async {
    state = state.copyWith(
      state: CurrentDrawLotteryConcreteState.loading,
      isLoading: true,
    );
    final response = await repository.fetchCurrentDrawLottery();
    response.fold((failure){
      state = state.copyWith(
        state: CurrentDrawLotteryConcreteState.failure,
        isLoading: false,
        message: failure.message,
      );
    }, (data) async{
      await cacheRepository.saveCurrentDrawLottery(currentDrawLottery: data);
      state = state.copyWith(
        state: CurrentDrawLotteryConcreteState.loaded,
        currentDrawLottery: data,
        isLoading: false,
        message: '',
      );
    });
  }

  void calculateTimeRemaining() async {
    if(state.currentDrawLottery != null){
      DateTime currentDate = DateTime.now();
      Duration duration = state.currentDrawLottery!.endDate.difference(currentDate);
      if(duration.inSeconds > 0){
        state = state.copyWith(
          secondsRemaining: duration.inSeconds,
          isLoading: false,
        );
      }else{
        final isRemoved = await cacheRepository.removeCurrentDrawLottery();
        if(isRemoved){
          state = state.copyWith(
              state: CurrentDrawLotteryConcreteState.expired,
              secondsRemaining: 0,
              isLoading: false,
              message: 'ຍັງບໍ່ທັນເປີດງວດໃໝ່'
          );
        }
      }
    }else{
      state = state.copyWith(
        isLoading: false,
        secondsRemaining: 0,
        currentDrawLottery: null,
        state: CurrentDrawLotteryConcreteState.close,
      );
    }
  }
}