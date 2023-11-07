

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lottery_panel/number_panel_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/order_lottery/order_lottery_model.dart';

import 'order_lottery_state.dart';

class OrderLotteryNotifier extends StateNotifier<OrderLotteryState>{

  OrderLotteryNotifier():super(const OrderLotteryState.initial());

  final Map<TabState,List<OrderLotteryModel>>
       _orderLotteryTwoDigitList={},
      _orderLotteryThreeDigitList={},
      _orderLotteryFourDigitList={},
      _orderLotteryFiveDigitList={},
      _orderLotterySixDigitList={};

  final Map<int,int> _total={};
  final Map<TabState,Map<int,int>> _totalMap={};

  void _setChangeStateOrderList(){
    if(state.tabState == TabState.modern){
      state = state.copyWith(
        twoDigitList:state.modernTwoDigitList,
        threeDigitList:state.modernThreeDigitList,
        fourDigitList:state.modernFourDigitList,
        fiveDigitList:state.modernFiveDigitList,
        sixDigitList:state.modernSixDigitList,
      );
    }else if(state.tabState == TabState.animal){

    }else if(state.tabState == TabState.betting){
      state = state.copyWith(
        twoDigitList:state.betTwoDigitList,
        threeDigitList:state.betThreeDigitList,
        fourDigitList:state.betFourDigitList,
        fiveDigitList:state.betFiveDigitList,
        sixDigitList:state.betSixDigitList,
      );
    }

  }

  void _setStateOrderList(int digitLength,List<OrderLotteryModel> orderMapLists,Map<TabState, int> total){
    if(state.tabState == TabState.modern){
      state = state.copyWith(
          modernTwoDigitList: digitLength == 2 ? orderMapLists
              : state.modernTwoDigitList,
          modernThreeDigitList: digitLength == 3 ? orderMapLists
              : state.modernThreeDigitList,
          modernFourDigitList: digitLength == 4 ? orderMapLists
              : state.modernFourDigitList,
          modernFiveDigitList: digitLength == 5 ? orderMapLists
              : state.modernFiveDigitList,
          modernSixDigitList: digitLength == 6 ? orderMapLists
              : state.modernSixDigitList,
          total: total,
          isHasOrder: {TabState.modern:true,TabState.animal:false,TabState.betting:false},
        twoDigitList: digitLength == 2 ? orderMapLists
            : state.twoDigitList,
        threeDigitList: digitLength == 3 ? orderMapLists
            : state.threeDigitList,
        fourDigitList: digitLength == 4 ? orderMapLists
            : state.fourDigitList,
        fiveDigitList: digitLength == 5 ? orderMapLists
            : state.fiveDigitList,
        sixDigitList: digitLength == 6 ? orderMapLists
            : state.sixDigitList,
      );
    }
    else if(state.tabState == TabState.animal){
      state = state.copyWith(
        animalDigitList: digitLength == 8 ? orderMapLists : state.animalDigitList,
        total: total,
        isHasOrder: {TabState.modern:false,TabState.animal:true,TabState.betting:false},
      );
    }else if(state.tabState == TabState.betting){
      state = state.copyWith(
          betTwoDigitList: digitLength == 2 ? orderMapLists
              : state.betTwoDigitList,
          betThreeDigitList: digitLength == 3 ? orderMapLists
              : state.betThreeDigitList,
          betFourDigitList: digitLength == 4 ? orderMapLists
              : state.betFourDigitList,
          betFiveDigitList: digitLength == 5 ? orderMapLists
              : state.betFiveDigitList,
          betSixDigitList: digitLength == 6 ? orderMapLists
              : state.betSixDigitList,
          total: total,
          isHasOrder: {TabState.modern:false,TabState.animal:false,TabState.betting:true},
        twoDigitList: digitLength == 2 ? orderMapLists
            : state.twoDigitList,
        threeDigitList: digitLength == 3 ? orderMapLists
            : state.threeDigitList,
        fourDigitList: digitLength == 4 ? orderMapLists
            : state.fourDigitList,
        fiveDigitList: digitLength == 5 ? orderMapLists
            : state.fiveDigitList,
        sixDigitList: digitLength == 6 ? orderMapLists
            : state.sixDigitList,
      );
    }

  }

  void _setCalculatePrice(int digitLength,List<OrderLotteryModel> orderMapLists,Map<TabState, int> total,{Map<TabState, int>? amount}){

    if(state.tabState == TabState.modern) {
      state = state.copyWith(
          modernTwoDigitList: digitLength == 2 ? orderMapLists
              : state.modernTwoDigitList,
          modernThreeDigitList: digitLength == 3 ? orderMapLists
              : state.modernThreeDigitList,
          modernFourDigitList: digitLength == 4 ? orderMapLists
              : state.modernFourDigitList,
          modernFiveDigitList: digitLength == 5 ? orderMapLists
              : state.modernFiveDigitList,
          modernSixDigitList: digitLength == 6 ? orderMapLists
              : state.modernSixDigitList,

          twoDigitList: digitLength == 2 ? orderMapLists
              : state.twoDigitList,
          threeDigitList: digitLength == 3 ? orderMapLists
              : state.threeDigitList,
          fourDigitList: digitLength == 4 ? orderMapLists
              : state.fourDigitList,
          fiveDigitList: digitLength == 5 ? orderMapLists
              : state.fiveDigitList,
          sixDigitList: digitLength == 6 ? orderMapLists
              : state.sixDigitList,
          total: total,
          amount: amount?.isEmpty == true || amount == null
              ? state.amount
              : amount
      );
    }else if(state.tabState == TabState.animal){
      state = state.copyWith(
          animalDigitList: digitLength == 8 ? orderMapLists : state.animalDigitList,
          total: total,
          amount: amount?.isEmpty == true || amount == null
              ? state.amount
              : amount
      );
    }else if(state.tabState == TabState.betting){
      state = state.copyWith(
          betTwoDigitList: digitLength == 2 ? orderMapLists
              : state.betTwoDigitList,
          betThreeDigitList: digitLength == 3 ? orderMapLists
              : state.betThreeDigitList,
          betFourDigitList: digitLength == 4 ? orderMapLists
              : state.betFourDigitList,
          betFiveDigitList: digitLength == 5 ? orderMapLists
              : state.betFiveDigitList,
          betSixDigitList: digitLength == 6 ? orderMapLists
              : state.betSixDigitList,

          twoDigitList: digitLength == 2 ? orderMapLists
              : state.twoDigitList,
          threeDigitList: digitLength == 3 ? orderMapLists
              : state.threeDigitList,
          fourDigitList: digitLength == 4 ? orderMapLists
              : state.fourDigitList,
          fiveDigitList: digitLength == 5 ? orderMapLists
              : state.fiveDigitList,
          sixDigitList: digitLength == 6 ? orderMapLists
              : state.sixDigitList,
          total: total,
          amount: amount?.isEmpty == true || amount == null
              ? state.amount
              : amount
      );
    }
  }

  void setTabState(int index){
    if(index == 0){
      state = state.copyWith(tabState:TabState.modern,typeDigit: index);
      _setChangeStateOrderList();
      _total.clear();
    }else if(index == 1){
      state = state.copyWith(tabState:TabState.animal,typeDigit: index);
      _setChangeStateOrderList();
      _total.clear();
    }else if(index == 2){
      state = state.copyWith(tabState:TabState.betting,typeDigit: index);
      _setChangeStateOrderList();
      _total.clear();
    }
  }

  Future<void> setOrderLotteryByPanelType(List<NumberPanelModel> orderList,int? price) async {

    final Map<int, Map<TabState,List<OrderLotteryModel>>> orderMapLists = {
      2: _orderLotteryTwoDigitList,
      3: _orderLotteryThreeDigitList,
      4: _orderLotteryFourDigitList,
      5: _orderLotteryFiveDigitList,
      6: _orderLotterySixDigitList,
      // Add more lists for other digit lengths as needed
    };

    if (orderList.first.digit.length == 2 || orderList.first.digit.length == 3 || orderList.first.digit.length == 4 || orderList.first.digit.length == 5 || orderList.first.digit.length == 6) {

      if(orderMapLists[orderList.first.digit.length]?[state.tabState]==null || orderMapLists[orderList.first.digit.length]?[state.tabState]?.isEmpty==true){
        orderMapLists[orderList.first.digit.length]?[state.tabState] = [];
      }

      for (int i = 0; i < orderList.length; i++) {
        bool hasMatchingDigit = orderMapLists[orderList.first.digit.length]![state.tabState]!.any((e) =>
        e.digit == orderList[i].digit);
        if (hasMatchingDigit) {
          int? currentPrice = orderMapLists[orderList.first.digit.length]![state.tabState]?[i].amount;
          int? sum = (currentPrice! + price!)>state.maximumPrice ? state.maximumPrice:(currentPrice + price);
          orderMapLists[orderList.first.digit.length]![state.tabState]?[i] = orderMapLists[orderList.first.digit.length]![state.tabState]![i].copyWith(amount: sum);
        } else {
          Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
          amount[state.tabState] = (amount[state.tabState]??0)+1;
          orderMapLists[orderList.first.digit.length]![state.tabState]!.add(OrderLotteryModel(
              id: amount[state.tabState], digit: orderList[i].digit, amount: price));
          state = state.copyWith(amount: amount);
        }
      }

      for(int i=2 ;i <=6 ;i++ ){
        if(orderMapLists[i]?[state.tabState]?.isNotEmpty==true) {
          _total[i] = orderMapLists[i]![state.tabState]!
              .map((item) => item.amount)
              .reduce((value, element) => value! + element!)!;
        }
      }

      Map<TabState,int> total = Map<TabState,int>.from(state.total);
        _totalMap[state.tabState] = _total;
        int newTotal = _totalMap[state.tabState]!.values.fold(0, (int previousValue, int element) {
          return previousValue + element;
      });
      total[state.tabState] = newTotal;

      //call the function
      _setStateOrderList(orderList.first.digit.length,orderMapLists[orderList.first.digit.length]![state.tabState]!,total);


    }
  }

  Future<void> setOrderLotteryByInput(String digit,int price) async {

    final Map<int, Map<TabState,List<OrderLotteryModel>>> orderMapLists = {
      2: _orderLotteryTwoDigitList,
      3: _orderLotteryThreeDigitList,
      4: _orderLotteryFourDigitList,
      5: _orderLotteryFiveDigitList,
      6: _orderLotterySixDigitList,
      // Add more lists for other digit lengths as needed
    };

    if (digit.length == 2 || digit.length == 3 || digit.length == 4 || digit.length == 5 || digit.length == 6) {

      if(orderMapLists[digit.length]?[state.tabState]==null || orderMapLists[digit.length]?[state.tabState]?.isEmpty==true){
        orderMapLists[digit.length]?[state.tabState] = [];
      }
      bool hasMatchingDigit = orderMapLists[digit.length]![state.tabState]!.any((e) =>
      e.digit == digit);
      if (hasMatchingDigit) {
        // Find the price for the selected ID
        final index = orderMapLists[digit.length]![state.tabState]!.indexWhere((item)=>item.digit==digit);
        final currentPrice = orderMapLists[digit.length]![state.tabState]?[index].amount;
        int? sum = (currentPrice! + price)>state.maximumPrice ? state.maximumPrice:(currentPrice + price);
        orderMapLists[digit.length]![state.tabState]?[index] = orderMapLists[digit.length]![state.tabState]![index].copyWith(amount: sum);

      } else {
        Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
        amount[state.tabState] = (amount[state.tabState]??0)+1;
        orderMapLists[digit.length]?[state.tabState]!.add(OrderLotteryModel(
            id: amount[state.tabState], digit: digit, amount: price));
        state = state.copyWith(amount: amount);
      }

      for(int i=2 ;i <=6 ;i++ ){
        if(orderMapLists[i]?[state.tabState]?.isNotEmpty==true) {
          _total[i] = orderMapLists[i]![state.tabState]!
              .map((item) => item.amount)
              .reduce((value, element) => value! + element!)!;
        }
      }

      Map<TabState,int> total = Map<TabState,int>.from(state.total);
      _totalMap[state.tabState] = _total;
      int newTotal = _totalMap[state.tabState]!.values.fold(0, (int previousValue, int element) {
        return previousValue + element;
      });

      total[state.tabState] = newTotal;
      //call the function
      _setStateOrderList(digit.length,orderMapLists[digit.length]![state.tabState]!,total);

    }
    else if(digit.length==8){
      List<OrderLotteryModel> animalDigitList =    List<OrderLotteryModel>.from(state.animalDigitList);
      bool hasMatchingDigit = animalDigitList.any((e) =>
      e.digit == digit);
      if (hasMatchingDigit) {
        // Find the price for the selected ID
        final index = animalDigitList.indexWhere((item)=>item.digit==digit);
        final currentPrice = animalDigitList[index].amount;
        int? sum = (currentPrice! + price)>state.maximumPrice ? state.maximumPrice:(currentPrice + price);
        animalDigitList[index] = animalDigitList[index].copyWith(amount: sum);

      } else {
        Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
        amount[state.tabState] = (amount[state.tabState]??0)+1;
        animalDigitList.add(OrderLotteryModel(
            id: amount[state.tabState], digit: digit, amount: price));
        state = state.copyWith(amount: amount);
      }


      int newTotal = animalDigitList
          .map((item) => item.amount)
          .reduce((value, element) => value! + element!)!;

      Map<TabState,int> total = Map<TabState,int>.from(state.total);
      total[state.tabState] = newTotal;
      //call the function
      _setStateOrderList(digit.length,animalDigitList,total);

    }
  }

  Future<void> increasePrice({required String? digit, required int index}) async{


    final Map<int, Map<TabState,List<OrderLotteryModel>>> orderMapLists = {
      2: _orderLotteryTwoDigitList,
      3: _orderLotteryThreeDigitList,
      4: _orderLotteryFourDigitList,
      5: _orderLotteryFiveDigitList,
      6: _orderLotterySixDigitList,
      // Add more lists for other digit lengths as needed
    };

    if (digit?.isNotEmpty==true && digit?.length == 2 || digit?.length == 3 || digit?.length == 4 || digit?.length == 5 || digit?.length == 6) {
      final int currentPrice = orderMapLists[digit?.length]?[state.tabState]?[index].amount ?? 0;

      if(currentPrice>state.maximumPrice) {
        return;
      }

      int? sum = currentPrice + state.minimumPrice;
      orderMapLists[digit?.length]?[state.tabState]![index] =
          orderMapLists[digit?.length]![state.tabState]![index].copyWith(amount: sum);

      int newTotal = state.total[state.tabState]! + state.minimumPrice;

      Map<TabState,int> total = Map<TabState,int>.from(state.total);

      total[state.tabState] = newTotal;

      _setCalculatePrice(digit!.length,orderMapLists[digit.length]![state.tabState]!,total);
    }
  }

  Future<void> decreasePrice({required String? digit,required int index}) async{

    final Map<int, Map<TabState,List<OrderLotteryModel>>> orderMapLists = {
      2: _orderLotteryTwoDigitList,
      3: _orderLotteryThreeDigitList,
      4: _orderLotteryFourDigitList,
      5: _orderLotteryFiveDigitList,
      6: _orderLotterySixDigitList,
      // Add more lists for other digit lengths as needed
    };

    if (digit?.isNotEmpty==true && digit?.length == 2 || digit?.length == 3 || digit?.length == 4 || digit?.length == 5 || digit?.length == 6) {
      final int currentPrice = orderMapLists[digit?.length]?[state.tabState]?[index].amount ?? 0;

      if(currentPrice<=state.minimumPrice) {
        return;
      }

      int? sum = currentPrice - state.minimumPrice;
      orderMapLists[digit?.length]![state.tabState]?[index] =
          orderMapLists[digit?.length]![state.tabState]![index].copyWith(amount: sum);

      int newTotal = state.total[state.tabState]! - state.minimumPrice;

      Map<TabState,int> total = Map<TabState,int>.from(state.total);

      total[state.tabState] = newTotal;

      _setCalculatePrice(digit!.length,orderMapLists[digit.length]![state.tabState]!,total);
    }
  }

  Future<void> removeOrder({required String? digit,required int index}) async{

    final Map<int, Map<TabState,List<OrderLotteryModel>>> orderMapLists = {
      2: _orderLotteryTwoDigitList,
      3: _orderLotteryThreeDigitList,
      4: _orderLotteryFourDigitList,
      5: _orderLotteryFiveDigitList,
      6: _orderLotterySixDigitList,
      // Add more lists for other digit lengths as needed
    };

    if (digit?.isNotEmpty == true && digit?.length == 2 || digit?.length == 3 || digit?.length == 4 || digit?.length == 5 || digit?.length == 6) {
      final int currentPrice = orderMapLists[digit?.length]?[state.tabState]?[index].amount ?? 0;
      orderMapLists[digit?.length]?[state.tabState]!.removeAt(index);

      int newTotal = state.total[state.tabState]! - currentPrice;
      int newAmount = state.amount[state.tabState]! - 1;

      Map<TabState,int> total = Map<TabState,int>.from(state.total);
      total[state.tabState] = newTotal;
      Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
      amount[state.tabState] = newAmount;

      _setCalculatePrice(digit!.length,orderMapLists[digit.length]![state.tabState]!,total,amount: amount);

      Map<TabState,bool> isHasOrder = Map<TabState,bool>.from(state.isHasOrder);
      isHasOrder[state.tabState] = false;
      if(state.amount[state.tabState]!<=0){
        state = state.copyWith(isHasOrder: isHasOrder);
      }
    }else if(digit?.length==8){
      List<OrderLotteryModel> animalDigitList =    List<OrderLotteryModel>.from(state.animalDigitList);

      final int currentPrice = animalDigitList[index].amount ?? 0;
      animalDigitList.removeAt(index);

      int newTotal = state.total[state.tabState]! - currentPrice;
      int newAmount = state.amount[state.tabState]! - 1;

      Map<TabState,int> total = Map<TabState,int>.from(state.total);
      total[state.tabState] = newTotal;
      Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
      amount[state.tabState] = newAmount;

      _setCalculatePrice(digit!.length,animalDigitList,total,amount: amount);

      Map<TabState,bool> isHasOrder = Map<TabState,bool>.from(state.isHasOrder);
      isHasOrder[state.tabState] = false;
      if(state.amount[state.tabState]!<=0){
        state = state.copyWith(isHasOrder: isHasOrder);
      }
    }
  }

  Future<void> removeAllOrder() async{

    //clear variable
    _orderLotteryTwoDigitList[state.tabState]?.clear();
    _orderLotteryThreeDigitList[state.tabState]?.clear();
    _orderLotteryFourDigitList[state.tabState]?.clear();
    _orderLotteryFiveDigitList[state.tabState]?.clear();
    _orderLotterySixDigitList[state.tabState]?.clear();
    _total.clear();
    _totalMap[state.tabState]=_total;

    //set isHasOrder to false specific TabState
    Map<TabState,bool> isHasOrder = Map<TabState,bool>.from(state.isHasOrder);
    isHasOrder[state.tabState] = false;

    //set empty data list specific TabState
    if(state.tabState==TabState.modern){
      state = state.copyWith(
        modernTwoDigitList: [],
        modernThreeDigitList: [],
        modernFourDigitList: [],
        modernFiveDigitList: [],
        modernSixDigitList: [],
        isHasOrder: isHasOrder,
      );
    }else if(state.tabState==TabState.animal){
      state = state.copyWith(
        animalDigitList: [],
        isHasOrder: isHasOrder,
      );
    }else if(state.tabState==TabState.betting){
      state = state.copyWith(
        betTwoDigitList: [],
        betThreeDigitList: [],
        betFourDigitList: [],
        betFiveDigitList: [],
        betSixDigitList: [],
        isHasOrder: isHasOrder,
      );
    }
    //set empty amount specific TabState
    Map<TabState,int> amount = Map<TabState,int>.from(state.amount);
    amount[state.tabState] = 0;

    //set empty total specific TabState
    Map<TabState,int> total = Map<TabState,int>.from(state.total);
    total[state.tabState] = 0;

    state = state.copyWith(
        twoDigitList: [],
        threeDigitList: [],
        fourDigitList: [],
        fiveDigitList: [],
        sixDigitList: [],
        amount: amount,
        total: total,
    );
  }

}