import 'package:equatable/equatable.dart';

enum RandomLotteryConcreteState {
  initial,
  loading,
  loaded,
  invalid,
}

class RandomLotteryState extends Equatable {
  final RandomLotteryConcreteState state;
  final bool isLoading;
  final String message;
  final int digitsType;
  final bool isOverNumber;
  final int overNumber;

  const RandomLotteryState({
    this.state = RandomLotteryConcreteState.initial,
    this.digitsType = 6,
    this.isLoading = false,
    this.message = '',
    this.isOverNumber = false,
    this.overNumber = 0,
  });

  RandomLotteryState copyWith({
    RandomLotteryConcreteState? state,
    bool? isLoading,
    String? message,
    int? digitsType,
    bool? isOverNumber,
    int? overNumber,
  }) {
    return RandomLotteryState(
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      digitsType: digitsType ?? this.digitsType,
      isOverNumber: isOverNumber?? this.isOverNumber,
      overNumber: overNumber ?? this.overNumber,
    );
  }

  @override
  List<Object?> get props =>
      [state, isLoading, message, digitsType, isOverNumber, overNumber];

  @override
  String toString() {
    return 'RandomLotteryState { state: $state, isLoading: $isLoading, message: $message, digitsType: $digitsType }';
  }

  const RandomLotteryState.initial({
    this.state = RandomLotteryConcreteState.initial,
    this.digitsType = 6,
    this.isLoading = false,
    this.message = '',
    this.isOverNumber = false,
    this.overNumber = 0,
  });
}
