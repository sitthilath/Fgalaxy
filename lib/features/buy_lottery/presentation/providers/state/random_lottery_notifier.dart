import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/providers/state/random_lottery_state.dart';

class RandomLotteryNotifier extends StateNotifier<RandomLotteryState> {
  RandomLotteryNotifier() : super(const RandomLotteryState.initial());

  void selectDigitsType(int digit) {
    state = state.copyWith(
      state: RandomLotteryConcreteState.initial,
      isLoading: false,
      isOverNumber: false,
      overNumber: 0,
      digitsType: digit,
    );
  }

  Future<void> randomLottery(
      {required List<int?> customDigitList,
      required int numbers,
      required int amount}) async {
    state = state.copyWith(
      state: RandomLotteryConcreteState.loading,
      isLoading: true,
      message: '',
      isOverNumber: false,
    );

   final totalNumbers = await _checkDigits(customDigitList, numbers);
    if(numbers > totalNumbers){
      state = state.copyWith(
        state: RandomLotteryConcreteState.invalid,
        isLoading: false,
        message: '',
        isOverNumber: true,
        overNumber: int.parse(totalNumbers.toString()),
      );
      return;
    }

    for(int i =0; i < numbers; i++){
      String randomized = "";
      for(int j =0; j< state.digitsType; j++){
        if(customDigitList.isNotEmpty && customDigitList[j] != null){
          randomized= "$randomized${customDigitList[j]}";
        }else{
          randomized= "$randomized${_randomDigit()}";
        }
      }
      print("$i====>$randomized");
    }

    state = state.copyWith(
      state: RandomLotteryConcreteState.loaded,
      isLoading: false,
      isOverNumber: false,
    );
  }

 Future<num> _checkDigits(List<int?> customDigitList, int numbers) {
    int fixedNumberCount = 0;
    for(int i = 0; i< customDigitList.length; i++){
      if(customDigitList[i] != null && i < state.digitsType){
        fixedNumberCount++;
      }
    }
    num totalNumbers = pow(10, state.digitsType - fixedNumberCount);

    return Future.value(totalNumbers);
  }

  _randomDigit() {
    return Random().nextInt(10)%10;
  }
}
