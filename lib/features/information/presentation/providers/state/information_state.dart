import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/infomation/information_model.dart';

enum InformationConcreteState {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAll,
}

class InformationState extends Equatable {
  final List<Information> informationList;
  final int cursor;
  final bool hasData;
  final InformationConcreteState state;
  final String message;
  final bool isLoading;

  const InformationState({
    this.informationList = const [],
    this.cursor = 0,
    this.hasData = false,
    this.state = InformationConcreteState.initial,
    this.message = '',
    this.isLoading = false,
  });

  const InformationState.initial({
    this.informationList = const [],
    this.isLoading = false,
    this.message = '',
    this.state = InformationConcreteState.initial,
    this.hasData = false,
    this.cursor = 0,
  });

  InformationState copyWith({
    List<Information>? informationList,
    int? cursor,
    bool? hasData,
    InformationConcreteState? state,
    String? message,
    bool? isLoading,
  }) {
    return InformationState(
      informationList: informationList ?? this.informationList,
      cursor: cursor ?? this.cursor,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [informationList, cursor, hasData, state, message];

  @override
  String toString() {
    return 'InformationState(isLoading:$isLoading, informationLength: ${informationList.length},cursor: $cursor, hasData: $hasData, state: $state, message: $message)';
  }
}
