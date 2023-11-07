import 'package:equatable/equatable.dart';
import '../../../../../../../shared/domain/models/price_category/price_category_model.dart';

enum BetLotteryConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class BetLotteryState extends Equatable {

  final bool hasData;
  final BetLotteryConcreteState state;
  final bool isLoading;
  final String message;
  final bool isShowPriceCategory;
  final List<PriceCategoryModel> priceCategoryList;
  final int priceSelected;

  const BetLotteryState({

    this.state = BetLotteryConcreteState.initial,
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
    this.isShowPriceCategory = false,
    this.priceCategoryList = const [],
    this.priceSelected = 1000
  });

  const BetLotteryState.initial({
    this.state = BetLotteryConcreteState.initial,
    this.hasData = false,
    this.message = '',
    this.isLoading = false,
    this.isShowPriceCategory = false,
    this.priceCategoryList = const [],
    this.priceSelected = 1000

  });

  BetLotteryState copyWith({
    bool? hasData,
    BetLotteryConcreteState? state,
    bool? isLoading,
    String? message,
    bool? isShowPriceCategory,
    List<PriceCategoryModel>? priceCategoryList,
    int? priceSelected
  }) {
    return BetLotteryState(
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
        isShowPriceCategory: isShowPriceCategory??this.isShowPriceCategory,
        priceCategoryList:priceCategoryList??this.priceCategoryList,
        priceSelected:priceSelected??this.priceSelected
    );
  }

  @override
  List<Object?> get props => [ hasData, isLoading, state, message,isShowPriceCategory,priceSelected];


}
