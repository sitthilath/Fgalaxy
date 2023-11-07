import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lottery_panel/lottery_panel_type_model.dart';

import '../../../../../../../shared/domain/models/lottery_panel/number_panel_model.dart';
import '../../../../../../../shared/domain/models/price_category/price_category_model.dart';

enum LotteryPanelConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

class LotteryPanelState extends Equatable {
  final List<NumberPanelModel> numberPanelList;
  final List<NumberPanelModel> numberChooseList;
  final List<LotteryPanelTypeModel> lotteryPanelTypeList;
  final LotteryPanelConcreteState state;
  final bool isLotteryPanelTypeSpecial;
  final List<PriceCategoryModel> priceCategoryList;
  final int priceSelected;
  final bool isShowPriceCategory;
  final bool isShowDraggableScroll;
  const LotteryPanelState({this.isShowDraggableScroll=false,this.isShowPriceCategory=false,this.priceSelected=1000,this.priceCategoryList=const[],this.isLotteryPanelTypeSpecial=false,this.lotteryPanelTypeList=const [],this.numberPanelList = const [],this.numberChooseList=const[],this.state = LotteryPanelConcreteState.initial});

  @override
  List<Object?> get props => [numberPanelList,numberChooseList,state,lotteryPanelTypeList];

  const LotteryPanelState.initial({
    this.isShowPriceCategory = false,
    this.isShowDraggableScroll = false,
    this.priceSelected = 1000,
  this.priceCategoryList=const[],
    this.numberPanelList = const [],
    this.numberChooseList = const [],
    this.lotteryPanelTypeList = const [],
    this.state = LotteryPanelConcreteState.initial,
    this.isLotteryPanelTypeSpecial=false
});

  LotteryPanelState copyWith({
    bool? isShowPriceCategory,
    int? priceSelected,
    List<PriceCategoryModel>? priceCategoryList,
    List<NumberPanelModel>? numberPanelList,
    List<NumberPanelModel>? numberChooseList,
    List<LotteryPanelTypeModel>? lotteryPanelTypeList,
    LotteryPanelConcreteState? state,
    bool? isLotteryPanelTypeSpecial,
    bool? isShowDraggableScroll
  }) {
    return LotteryPanelState(
        isShowDraggableScroll:isShowDraggableScroll??this.isShowDraggableScroll,
        isShowPriceCategory:isShowPriceCategory??this.isShowPriceCategory,
        priceSelected:priceSelected??this.priceSelected,
        priceCategoryList:priceCategoryList??this.priceCategoryList,
        numberPanelList:
        numberPanelList ?? this.numberPanelList,
      numberChooseList:numberChooseList??this.numberChooseList,
      lotteryPanelTypeList:lotteryPanelTypeList??this.lotteryPanelTypeList,
      state: state ?? this.state,
        isLotteryPanelTypeSpecial:isLotteryPanelTypeSpecial?? this.isLotteryPanelTypeSpecial
    );
  }
}
