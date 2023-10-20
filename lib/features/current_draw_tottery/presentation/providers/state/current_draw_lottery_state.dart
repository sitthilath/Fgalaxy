import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/current_draw_lottery/current_draw_lottery_model.dart';

enum CurrentDrawLotteryConcreteState {
  initial,
  loading,
  loaded,
  failure,
  expired,
  close,
}

class CurrentDrawLotteryState extends Equatable {
  final CurrentDrawLottery? currentDrawLottery;
  final CurrentDrawLotteryConcreteState state;
  final bool isLoading;
  final String message;
  final int secondsRemaining;

  const CurrentDrawLotteryState({
    this.currentDrawLottery,
    this.state = CurrentDrawLotteryConcreteState.initial,
    this.message = '',
    this.isLoading = false,
    this.secondsRemaining = 0,
  });

  const CurrentDrawLotteryState.initial({
    this.currentDrawLottery,
    this.state = CurrentDrawLotteryConcreteState.initial,
    this.isLoading = false,
    this.message = '',
    this.secondsRemaining = 0,
  });

  CurrentDrawLotteryState copyWith({
    CurrentDrawLottery? currentDrawLottery,
    CurrentDrawLotteryConcreteState? state,
    bool? isLoading,
    String? message,
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
    int? secondsRemaining,
  }) {
    return CurrentDrawLotteryState(
      currentDrawLottery: currentDrawLottery ?? this.currentDrawLottery,
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
    );
  }

  @override
  List<Object?> get props => [
        currentDrawLottery,
        state,
        isLoading,
        message,
        secondsRemaining,
      ];

  @override
  String toString() {
    return 'CurrentDrawLotteryState { '
        'currentDrawLottery: $currentDrawLottery, '
        'state: $state, '
        'isLoading: $isLoading, '
        'message: $message, '
        'secondsRemaining: $secondsRemaining,'
        '}';
  }
}

// class CountdownTimer {
//   final int days;
//   final int hours;
//   final int minutes;
//   final int seconds;
//
//   CountdownTimer({
//     this.days = 0,
//     this.hours = 0,
//     this.minutes = 0,
//     this.seconds = 0,
//   });
//
//   CountdownTimer.initial({
//     this.days = 0,
//     this.hours = 0,
//     this.minutes = 0,
//     this.seconds = 0,
//   });
// }
