import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lotteries_treatise/lotteries_treatise_model.dart';

enum LotteriesTreatiseConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class LotteriesTreatiseState extends Equatable {
  final List<LotteriesTreatise> lotteriesTreatiseList;
  final bool hasLotteriesTreatise;
  final bool isLoading;
  final String message;
  final LotteriesTreatiseConcreteState state;

  const LotteriesTreatiseState({
    this.state = LotteriesTreatiseConcreteState.initial,
    this.hasLotteriesTreatise = false,
    this.lotteriesTreatiseList = const [],
    this.message = '',
    this.isLoading = false,
  });

  const LotteriesTreatiseState.initial({
    this.lotteriesTreatiseList = const [],
    this.hasLotteriesTreatise = false,
    this.isLoading = false,
    this.message = '',
    this.state = LotteriesTreatiseConcreteState.initial,
  });

  LotteriesTreatiseState copyWith({
    List<LotteriesTreatise>? lotteriesTreatiseList,
    bool? hasLotteriesTreatise,
    bool? isLoading,
    String? message,
    LotteriesTreatiseConcreteState? state,
  }) {
    return LotteriesTreatiseState(
      lotteriesTreatiseList:
          lotteriesTreatiseList ?? this.lotteriesTreatiseList,
      hasLotteriesTreatise: hasLotteriesTreatise ?? this.hasLotteriesTreatise,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        lotteriesTreatiseList,
        hasLotteriesTreatise,
        isLoading,
        message,
        state,
      ];

  @override
  String toString() {
    return 'LotteriesTreatiseState { '
        'lotteriesTreatiseList: $lotteriesTreatiseList, '
        'hasLotteriesTreatise: $hasLotteriesTreatise, '
        'isLoading: $isLoading, '
        'message: $message, '
        'state: $state'
        ' }';
  }
}
