import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';

enum DreamTreatiseConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchedAllDreamTreatise,
  fetchingMore,
}

class DreamTreatiseState extends Equatable {
  final List<DreamTreatise> dreamTreatisesList;
  final DreamTreatise? dreamTreatise;
  final DreamTreatiseConcreteState state;
  final int cursor;
  final bool hasDreamTreatise;
  final String message;
  final bool isLoading;

  const DreamTreatiseState({
    this.dreamTreatisesList = const [],
    this.dreamTreatise,
    this.state = DreamTreatiseConcreteState.initial,
    this.cursor = 0,
    this.isLoading = false,
    this.message = '',
    this.hasDreamTreatise = false,
  });

  DreamTreatiseState copyWith({
    List<DreamTreatise>? dreamTreatisesList,
    DreamTreatise? dreamTreatise,
    DreamTreatiseConcreteState? state,
    int? cursor,
    bool? hasDreamTreatise,
    String? message,
    bool? isLoading,
  }) {
    return DreamTreatiseState(
      dreamTreatisesList: dreamTreatisesList ?? this.dreamTreatisesList,
      dreamTreatise: dreamTreatise ?? this.dreamTreatise,
      state: state ?? this.state,
      cursor: cursor ?? this.cursor,
      hasDreamTreatise: hasDreamTreatise ?? this.hasDreamTreatise,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

 const DreamTreatiseState.initial({
    this.dreamTreatisesList = const [],
    this.dreamTreatise,
    this.state = DreamTreatiseConcreteState.initial,
    this.cursor = 0,
    this.hasDreamTreatise = false,
    this.message = '',
    this.isLoading = false,
});

  @override
  List<Object?> get props => [
        dreamTreatisesList,
        dreamTreatise,
        cursor,
        hasDreamTreatise,
        message,
        isLoading,
        state,
      ];

  @override
  String toString() {
    return 'DreamTreatiseState { '
        'dreamTreatisesList: $dreamTreatisesList, '
        'dreamTreatise: $dreamTreatise, '
        'state: $state,'
        'cursor: $cursor, '
        'hasDreamTreatise: $hasDreamTreatise, '
        'message: $message, '
        'isLoading: $isLoading }';
  }
}
