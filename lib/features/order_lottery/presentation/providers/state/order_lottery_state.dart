import 'package:equatable/equatable.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/order_lottery/order_lottery_model.dart';

enum OrderLotteryConcreteState {
  initial,
  loading,
  loaded,
  failure,
}

enum TabState {
  modern,
  animal,
  betting,
}

class OrderLotteryState extends Equatable {

  final int typeDigit;

  final List<OrderLotteryModel> animalDigitList;
  final List<OrderLotteryModel> twoDigitList;
  final List<OrderLotteryModel> threeDigitList;
  final List<OrderLotteryModel> fourDigitList;
  final List<OrderLotteryModel> fiveDigitList;
  final List<OrderLotteryModel> sixDigitList;

  final List<OrderLotteryModel> modernTwoDigitList;
  final List<OrderLotteryModel> modernThreeDigitList;
  final List<OrderLotteryModel> modernFourDigitList;
  final List<OrderLotteryModel> modernFiveDigitList;
  final List<OrderLotteryModel> modernSixDigitList;

  final List<OrderLotteryModel> betTwoDigitList;
  final List<OrderLotteryModel> betThreeDigitList;
  final List<OrderLotteryModel> betFourDigitList;
  final List<OrderLotteryModel> betFiveDigitList;
  final List<OrderLotteryModel> betSixDigitList;
  final Map<TabState, int> total;
  final Map<TabState, int> amount;
  final Map<TabState, OrderLotteryConcreteState> state;
  final int minimumPrice;
  final int maximumPrice;
  final TabState tabState;
  final Map<TabState,bool> isHasOrder;

  const OrderLotteryState({
    this.typeDigit=0,
    this.isHasOrder = const {TabState.modern:false, TabState.animal:false,TabState.betting:false},
    this.tabState = TabState.modern,
    this.animalDigitList = const [],
    this.maximumPrice = 1000000,
    this.minimumPrice = 1000,
    this.fourDigitList = const [],
    this.fiveDigitList = const [],
    this.sixDigitList = const [],
    this.twoDigitList = const [],
    this.threeDigitList = const [],
    this.total = const {},
    this.amount = const {},
    this.state = const {},
    this.betTwoDigitList = const [],
    this.betThreeDigitList = const [],
    this.betFourDigitList = const [],
    this.betFiveDigitList = const [],
    this.betSixDigitList = const [],

    this.modernTwoDigitList=const [],
    this.modernThreeDigitList=const [],
    this.modernFourDigitList=const [],
    this.modernFiveDigitList=const [],
    this.modernSixDigitList=const [],
  }
      );

  @override
  List<Object?> get props => [];

  const OrderLotteryState.initial(
      {
        this.typeDigit=0,
        this.isHasOrder = const {TabState.modern:false, TabState.animal:false,TabState.betting:false},
        this.tabState = TabState.modern,
        this.animalDigitList = const [],
      this.maximumPrice = 1000000,
      this.minimumPrice = 1000,
        this.fourDigitList = const [],
        this.fiveDigitList = const [],
        this.sixDigitList = const [],
        this.twoDigitList = const [],
        this.threeDigitList = const [],
      this.total = const {},
      this.amount = const {},
      this.state = const {},
        this.betTwoDigitList = const [],
        this.betThreeDigitList = const [],
        this.betFourDigitList = const [],
        this.betFiveDigitList = const [],
        this.betSixDigitList = const [],
        this.modernTwoDigitList=const [],
        this.modernThreeDigitList=const [],
        this.modernFourDigitList=const [],
        this.modernFiveDigitList=const [],
        this.modernSixDigitList=const [],
      });



  OrderLotteryState copyWith(
      {
        int? typeDigit,
         List<OrderLotteryModel>? twoDigitList,
         List<OrderLotteryModel>? threeDigitList,
         List<OrderLotteryModel>? fourDigitList,
         List<OrderLotteryModel>? fiveDigitList,
         List<OrderLotteryModel>? sixDigitList,
       List<OrderLotteryModel>? animalDigitList,
      Map<TabState, int>? total,
      Map<TabState, int>? amount,
      Map<TabState, OrderLotteryConcreteState>? state,
      int? minimumPrice,
      int? maximumPrice,
        TabState? tabState,
        Map<TabState,bool>? isHasOrder,
         List<OrderLotteryModel>? betTwoDigitList,
         List<OrderLotteryModel>? betThreeDigitList,
         List<OrderLotteryModel>? betFourDigitList,
         List<OrderLotteryModel>? betFiveDigitList,
         List<OrderLotteryModel>? betSixDigitList,

        List<OrderLotteryModel>? modernTwoDigitList,
        List<OrderLotteryModel>? modernThreeDigitList,
        List<OrderLotteryModel>? modernFourDigitList,
        List<OrderLotteryModel>? modernFiveDigitList,
        List<OrderLotteryModel>? modernSixDigitList,
      }) {
    return OrderLotteryState(
      typeDigit:typeDigit??this.typeDigit,
      modernTwoDigitList: modernTwoDigitList ?? this.modernTwoDigitList,
      modernThreeDigitList: modernThreeDigitList ?? this.modernThreeDigitList,
      modernFourDigitList: modernFourDigitList ?? this.modernFourDigitList,
      modernFiveDigitList: modernFiveDigitList ?? this.modernFiveDigitList,
      modernSixDigitList: modernSixDigitList ?? this.modernSixDigitList,

        isHasOrder:isHasOrder??this.isHasOrder,
      tabState: tabState??this.tabState,
        minimumPrice: minimumPrice ?? this.minimumPrice,
        maximumPrice: maximumPrice ?? this.maximumPrice,
        fourDigitList: fourDigitList ?? this.fourDigitList,
        fiveDigitList: fiveDigitList ?? this.fiveDigitList,
        sixDigitList: sixDigitList ?? this.sixDigitList,
        twoDigitList: twoDigitList ?? this.twoDigitList,
        threeDigitList: threeDigitList ?? this.threeDigitList,
        total: total ?? this.total,
        state: state ?? this.state,
        amount: amount ?? this.amount,
        animalDigitList: animalDigitList ?? this.animalDigitList,
      betTwoDigitList: betTwoDigitList ?? this.betTwoDigitList,
      betThreeDigitList: betThreeDigitList ?? this.betThreeDigitList,
      betFourDigitList: betFourDigitList ?? this.betFourDigitList,
      betFiveDigitList: betFiveDigitList ?? this.betFiveDigitList,
      betSixDigitList: betSixDigitList ?? this.betSixDigitList,
    );
  }
}
