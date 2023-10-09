import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/banners/banner_model.dart';

enum BannerConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class BannerState extends Equatable {
  final List<Banner> bannerList;
  final bool hasData;
  final BannerConcreteState state;
  final bool isLoading;
  final String message;

  const BannerState({
    this.bannerList = const [],
    this.state = BannerConcreteState.initial,
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
  });

  const BannerState.initial({
    this.bannerList = const [],
    this.state = BannerConcreteState.initial,
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
  });

  BannerState copyWith({
    List<Banner>? bannerList,
    bool? hasData,
    BannerConcreteState? state,
    bool? isLoading,
    String? message,
  }) {
    return BannerState(
      bannerList: bannerList ?? this.bannerList,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [bannerList, hasData, isLoading, state, message];

  @override
  String toString() {
    return 'BannerState {'
        ' bannerList: $bannerList,'
        ' hasData: $hasData,'
        ' state: $state,'
        ' isLoading: $isLoading,'
        ' message: $message'
        ' }';
  }
}
