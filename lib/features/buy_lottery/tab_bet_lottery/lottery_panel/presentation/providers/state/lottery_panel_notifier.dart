import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lottery_panel/lottery_panel_type_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/lottery_panel/number_panel_model.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/price_category/price_category_model.dart';

import 'lottery_panel_state.dart';

class LotteryPanelNotifier extends StateNotifier<LotteryPanelState> {
  LotteryPanelNotifier() : super(const LotteryPanelState.initial());

  List<NumberPanelModel> filterNumberList = [];

  final List<String> _selectedNumberList = [];

  int _lastLotteryPanelType = 0, _lastPriceCategory = 0;

  List<NumberPanelModel> get  numberSelectedPanelList => state.numberPanelList
      .where((e) => e.isSelected)
      .toList();

  final draggableScrollableController = DraggableScrollableController();

  void draggableScrollListener() {
    draggableScrollableController.addListener(() {
      if (draggableScrollableController.size <= 0.099) {
        state = state.copyWith(isShowDraggableScroll: false);
      } else {
        state = state.copyWith(isShowDraggableScroll: true);
      }
    });
  }

  void showDraggableScroll() {
    state = state.copyWith(isShowDraggableScroll: !state.isShowDraggableScroll);
    draggableScrollableController.animateTo(0.9,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void hideDraggableScroll() {
    draggableScrollableController.animateTo(0.0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);

    resetNumberPanel();
    resetNumberChoose();
    resetLotteryPanelType();
  }

  Future<void> initialize() async {
    try {
      state = state.copyWith(state: LotteryPanelConcreteState.loading);
      initPriceSelectList();
      generateLotteryPanelType();
      generateNumberChoose();
      generateNumberPanel();
      draggableScrollListener();
    } catch (e) {
      state = state.copyWith(state: LotteryPanelConcreteState.failure);
    }
  }

  void toggleShowPriceCategory() {
    state = state.copyWith(isShowPriceCategory: !state.isShowPriceCategory);
  }

  Future<void> togglePriceSelected(int id, int price) async {
    if (_lastPriceCategory != id) {
      /* set selected lottery panel type */
      List<PriceCategoryModel> priceCategory = state.priceCategoryList
          .map((e) => e.id == id
              ? e.copyWith(isSelected: true)
              : e.copyWith(isSelected: false))
          .toList();

      state = state.copyWith(
          priceCategoryList: priceCategory, priceSelected: price);
      _lastPriceCategory = id;
    }
  }

  Future<void> initPriceSelectList() async {
    final List<PriceCategoryModel> priceSelectList = [
      const PriceCategoryModel(
          id: 1, text: "1,000", value: 1000, isSelected: true),
      const PriceCategoryModel(
          id: 2, text: "2,000", value: 2000, isSelected: false),
      const PriceCategoryModel(
          id: 3, text: "3,000", value: 3000, isSelected: false),
      const PriceCategoryModel(
          id: 4, text: "5,000", value: 5000, isSelected: false),
      const PriceCategoryModel(
          id: 5, text: "10,000", value: 10000, isSelected: false),
    ];

    state = state.copyWith(priceCategoryList: priceSelectList);
  }

  Future<void> generateNumberPanel() async {
    try {
      List<NumberPanelModel> numberList = List.generate(
        100,
        (index) => NumberPanelModel(
          id: index + 1,
          digit: index.toString().padLeft(2, '0'),
          isSelected: false,
        ),
      );

      state = state.copyWith(
          numberPanelList: numberList, state: LotteryPanelConcreteState.loaded);
    } catch (e) {
      debugPrint("lottery panel generateNumberPanel error:$e");
    }
  }

  Future<void> generateNumberChoose() async {
    try {
      List<NumberPanelModel> numberList = List.generate(
        10,
        (index) => NumberPanelModel(
          id: index + 1,
          digit: index.toString(),
          isSelected: false,
        ),
      );

      state = state.copyWith(
          numberChooseList: numberList,
          state: LotteryPanelConcreteState.loaded);
    } catch (e) {
      debugPrint("lottery panel generateNumberChoose error:$e");
    }
  }

  Future<void> generateLotteryPanelType() async {
    try {
      List<String> nameList = [
        '19 ປະຕູ',
        'ລູດໜ້າ',
        'ລູດຫຼັງ',
        '2ໂຕຄີກ',
        '2ໂຕຄູ່',
        '2ໂຕຕ່ຳ',
        '2ໂຕສູງ'
      ];
      List<LotteryPanelTypeModel> typeList = List.generate(
        7,
        (index) => LotteryPanelTypeModel(
            id: index + 1,
            name: nameList[index],
            isSelected: false,
            isSpecial: index == 1 || index == 2 || index == 3 ? true : false),
      );

      state = state.copyWith(
          lotteryPanelTypeList: typeList,
          state: LotteryPanelConcreteState.loaded);
    } catch (e) {
      debugPrint("lottery panel generateLotteryPanelType error:$e");
    }
  }

  Future<void> toggleNumberPanelSelected(
      List<NumberPanelModel> filterNumberList,int type) async {
    for (int i = 0; i < filterNumberList.length; i++) {
      try {
        List<NumberPanelModel> numberList = state.numberPanelList.map((e) {
          if (e.id == filterNumberList[i].id) {

            switch(type){
              case 1:
                return e.copyWith(isSelected:_selectedNumberList.any((element) => e.digit.contains(element)));
                case 2:
                  return e.copyWith(isSelected:_selectedNumberList.any((element) => e.digit.startsWith(element)));
              case 3:
                return e.copyWith(isSelected:_selectedNumberList.any((element) => e.digit.endsWith(element)));
              default:
                return e.copyWith(isSelected:!e.isSelected);
            }
          } else {
            return e;
          }
        }).toList();
        state = state.copyWith(numberPanelList: numberList);
      } catch (e) {
        debugPrint("lottery panel toggleNumberPanelSelected error:$e");
      }
    }
  }

  Future<void> toggleNumberChoose(String number) async {
    try {
      if (number != "-1") {
          bool exists = _selectedNumberList.contains(number);
          if (exists) {
            _selectedNumberList.removeWhere((element) => element.contains(number));
          } else {
            _selectedNumberList.add(number);
          }
      }



      /* check selected lottery panel type is 19doors */
      if (_lastLotteryPanelType == 1) {


        /* set selected number choose of 19 doors */
        List<NumberPanelModel> numberList = state.numberChooseList
            .map((e) =>
        e.digit == number ? e.copyWith(isSelected: !e.isSelected) : e)
            .toList();
        state = state.copyWith(numberChooseList: numberList);

        /* set selected number panel of 19 doors */
        filterNumberList = state.numberPanelList
            .where((item) => item.digit.contains(number))
            .toList();
        toggleNumberPanelSelected(filterNumberList,1);


      }

      /* check selected lottery panel type is front root */
      if (_lastLotteryPanelType == 2) {


        /* set selected number choose of front root */
        List<NumberPanelModel> numberList = state.numberChooseList
            .map((e) => e.digit.startsWith(number)
            ?  e.copyWith(isSelected: !e.isSelected) : e)
            .toList();
        state = state.copyWith(numberChooseList: numberList);

        /* set selected number panel of front root */
        filterNumberList = state.numberPanelList
            .where((item) => item.digit.startsWith(number))
            .toList();
        toggleNumberPanelSelected(filterNumberList,2);

      }

      /* check selected lottery panel type is back root */
      if (_lastLotteryPanelType == 3) {

        /* set selected number choose of back root */
        List<NumberPanelModel> numberList = state.numberChooseList
            .map((e) => e.digit.endsWith(number)
            ?  e.copyWith(isSelected: !e.isSelected) : e)
            .toList();
        state = state.copyWith(numberChooseList: numberList);

        /* set selected number panel of back root */
        filterNumberList = state.numberPanelList
            .where((item) => item.digit.endsWith(number))
            .toList();
        toggleNumberPanelSelected(filterNumberList,3);


      }


      //}
    } catch (e) {
      debugPrint("lottery panel toggleNumberChoose error:$e");
    }
  }

  Future<void> toggleLotteryPanelType(int id) async {
    try {
      //check clicked on different lottery panel type
      if (_lastLotteryPanelType != id) {

        /* set selected number to unselected */
        toggleNumberChoose("-1");
        resetNumberPanel();
        /* check is 19 doors, front root, back root */
        if (id > 0 && id < 4) {
          resetNumberChoose();
          _selectedNumberList.clear();
          filterNumberList = [];

          /* isLotteryPanelTypeSpecial==true show choose number */
          state = state.copyWith(isLotteryPanelTypeSpecial: true);
        } else {
          /* isLotteryPanelTypeSpecial==false not show choose number */
          state = state.copyWith(isLotteryPanelTypeSpecial: false);
        }

        /* set selected number panel of 2single */
        if (id == 4) {
          filterNumberList = state.numberPanelList.where((item) {
            final lastChar = item.digit.substring(item.digit.length - 1);
            return lastChar == '1' ||
                lastChar == '3' ||
                lastChar == '5' ||
                lastChar == '7' ||
                lastChar == '9';
          }).toList();
          toggleNumberPanelSelected(filterNumberList,4);
        }

        /* set selected number panel of 2couple */
        if (id == 5) {
          filterNumberList = state.numberPanelList.where((item) {
            final lastChar = item.digit.substring(item.digit.length - 1);
            return lastChar == '0' ||
                lastChar == '2' ||
                lastChar == '4' ||
                lastChar == '6' ||
                lastChar == '8';
          }).toList();
          toggleNumberPanelSelected(filterNumberList,5);
        }

        /* set selected number panel of 2low */
        if (id == 6) {
          filterNumberList = state.numberPanelList.where((item) {
            final int number = int.parse(item.digit);
            return number >= 0 && number <= 49;
          }).toList();
          toggleNumberPanelSelected(filterNumberList,6);
        }

        /* set selected number panel of 2high */
        if (id == 7) {
          filterNumberList = state.numberPanelList.where((item) {
            final int number = int.parse(item.digit);
            return number >= 50 && number <= 99;
          }).toList();

          toggleNumberPanelSelected(filterNumberList,7);
        }

        /* set selected lottery panel type */
        List<LotteryPanelTypeModel> lotteryPanelType = state
            .lotteryPanelTypeList
            .map((e) => e.id == id
                ? e.copyWith(isSelected: true)
                : e.copyWith(isSelected: false))
            .toList();
        state = state.copyWith(lotteryPanelTypeList: lotteryPanelType);

        _lastLotteryPanelType = id;
      }
    } catch (e) {
      debugPrint("lottery panel toggleLotteryPanelType error:$e");
    }
  }




  void resetNumberPanel(){


    filterNumberList.clear();
    List<NumberPanelModel> numberPanelList = state.numberPanelList
        .map((e) => e.copyWith(isSelected: false))
        .toList();

    state = state.copyWith(numberPanelList: numberPanelList);
  }

  void resetNumberChoose(){

    _selectedNumberList.clear();
    List<NumberPanelModel> numberChooseList = state.numberChooseList
        .map((e) => e.copyWith(isSelected: false))
        .toList();


    state = state.copyWith(numberChooseList: numberChooseList);
  }

  void resetLotteryPanelType(){
    _lastLotteryPanelType = 0;
    List<LotteryPanelTypeModel> lotteryPanelType = state
        .lotteryPanelTypeList
        .map((e) =>e.copyWith(isSelected: false)
       )
        .toList();

    state = state.copyWith(lotteryPanelTypeList: lotteryPanelType,isLotteryPanelTypeSpecial: false);
  }
}
