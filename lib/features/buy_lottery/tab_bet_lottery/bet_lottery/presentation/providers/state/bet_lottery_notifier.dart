
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../shared/domain/models/price_category/price_category_model.dart';
import 'bet_lottery_state.dart';


class BetLotteryNotifier extends StateNotifier<BetLotteryState>{

   BetLotteryNotifier() : super(const BetLotteryState.initial());

   int _lastPriceCategory=0;

   Future<void> initPriceSelectList() async{
      final List<PriceCategoryModel> priceSelectList = [
         const PriceCategoryModel(
             id: 1,
             text: "1,000",
             value: 1000,
             isSelected: true
         ),
         const PriceCategoryModel(
             id: 2,
             text: "2,000",
             value: 2000,
             isSelected: false
         ),
         const  PriceCategoryModel(
             id: 3,
             text: "3,000",
             value: 3000,
             isSelected: false
         ),
         const PriceCategoryModel(
             id: 4,
             text: "5,000",
             value: 5000,
             isSelected: false
         ),
         const PriceCategoryModel(
             id: 5,
             text: "10,000",
             value: 10000,
             isSelected: false
         ),
      ];

      state = state.copyWith(priceCategoryList: priceSelectList);
   }

   Future<void> setPriceSelected(int id,int price) async {

      if(_lastPriceCategory != id) {
         /* set selected lottery panel type */
         List<PriceCategoryModel> priceCategory = state
             .priceCategoryList
             .map((e) =>
         e.id == id
             ? e.copyWith(isSelected: true)
             : e.copyWith(isSelected: false))
             .toList();


         state = state.copyWith(priceCategoryList: priceCategory,priceSelected:price);
         _lastPriceCategory = id;
      }
   }

   void toggleShowPriceCategory(){
      state = state.copyWith(isShowPriceCategory: !state.isShowPriceCategory);
   }
}