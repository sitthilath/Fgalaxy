import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/domain/repository/last_lottery_result_repository.dart';
import 'package:galaxy_18_lottery_app/features/last_lottery_result/presentation/providers/state/last_lottery_result_state.dart';
import 'package:galaxy_18_lottery_app/services/lotteries_treatise_cache_service/domain/repository/lotteries_treatise_cache_repository.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/last_lottery_result/last_lottery_result_model.dart';

class LastLotteryResultNotifier extends StateNotifier<LastLotteryResultState> {
  final LastLotteryResultRepository repository;
  final LotteriesTreatiseCacheRepository cacheRepository;

  LastLotteryResultNotifier(
      {required this.cacheRepository, required this.repository})
      : super(const LastLotteryResultState.initial());

   Future<void> getLastLotteryResult() async {
     state = state.copyWith(
       state: LastLotteryResultConcreteState.loading,
       isLoading: true,
     );

     final response = await repository.getLastLotteryResult();
     response.fold((failure){
       state = state.copyWith(
         state: LastLotteryResultConcreteState.failure,
         isLoading: false,
         message: '',
       );
     }, (data) async {
      await _findInLotteryTreatise(data);
     });
   }

  Future<void> _findInLotteryTreatise(LastLotteryResult data) async {
     final hasData = await cacheRepository.hasLotteriesTreatise();
    if(hasData){
      final result = await cacheRepository.fetchLotteriesTreatise();
      result.fold((failure){
        state = state.copyWith(
         state: LastLotteryResultConcreteState.loaded,
          hasLotteryResult: true,
          isLoading: false,
          message: failure.message,
          lastLotteryResult: data,
        );
      }, (lotto){
        lottoTreatiseLoop:
        for (var item in lotto) {
          for (var digit in item.digits) {
            if (digit.digit.contains(data.lotteryResults.last.value)) {
               state = state.copyWith(
                state: LastLotteryResultConcreteState.loaded,
                lotteriesTreatise: item,
                lastLotteryResult: data,
                hasLotteryResult: true,
                isLoading: false,
              );
              break lottoTreatiseLoop;
            }
          }
        }
      });
    }else{
      state = state.copyWith(
        state: LastLotteryResultConcreteState.loaded,
        hasLotteryResult: true,
        isLoading: false,
        message:'',
        lastLotteryResult: data,
      );
    }
  }
}
