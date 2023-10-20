import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/last_lottery_result/last_lottery_result_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';

enum LastLotteryResultConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class LastLotteryResultState extends Equatable{
  final LastLotteryResult? lastLotteryResult;
  final LotteriesTreatise? lotteriesTreatise;
  final LastLotteryResultConcreteState state;
  final bool isLoading;
  final String message;
  final bool hasLotteryResult;

  const LastLotteryResultState({
    this.lastLotteryResult,
    this.lotteriesTreatise,
    required this.state,
    required this.isLoading,
    required this.message,
    required this.hasLotteryResult,
  });

  const LastLotteryResultState.initial({
    this.lastLotteryResult,
    this.lotteriesTreatise,
    this.state = LastLotteryResultConcreteState.initial,
    this.isLoading = false,
    this.message = '',
    this.hasLotteryResult = false,
});

  LastLotteryResultState copyWith({
    LastLotteryResult? lastLotteryResult,
    LotteriesTreatise? lotteriesTreatise,
    LastLotteryResultConcreteState? state,
    bool? isLoading,
    String? message,
    bool? hasLotteryResult,
  }) {
    return LastLotteryResultState(
      lastLotteryResult: lastLotteryResult ?? this.lastLotteryResult,
      lotteriesTreatise: lotteriesTreatise ?? this.lotteriesTreatise,
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      hasLotteryResult: hasLotteryResult ?? this.hasLotteryResult,
    );
  }

  @override
  List<Object?> get props => [
    lastLotteryResult,
    lotteriesTreatise,
    state,
    isLoading,
    message,
    hasLotteryResult,
  ];

  @override
  String toString() {
    return 'LastLotteryResultState { lastLotteryResult: $lastLotteryResult, lotteriesTreatise: $lotteriesTreatise, state: $state, isLoading: $isLoading, message: $message, hasLotteryResult: $hasLotteryResult }';
  }
}
