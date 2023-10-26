import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/current_page_item_provider.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/state/banner_state.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

Widget indicator(WidgetRef ref, BannerState state){
  final int currentPageItem = ref.watch(currentPageItemProvider);
  return Positioned(
    left: 0,
    right: 0,
    bottom: 10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: state.bannerList.map((item) {
        final index = state.bannerList.indexOf(item);
        return AnimatedContainer(
          width: currentPageItem == index ? 25 : 8,
          height: 5,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: currentPageItem == index
                ? AppColor.primaryPurple
                : AppColor.whiteColor,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 3.0),
        );
      }).toList(),
    ),
  );
}