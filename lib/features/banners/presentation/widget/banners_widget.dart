import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/banners_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class BannersWidget extends ConsumerStatefulWidget {
  const BannersWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BannerState();
}

class BannerState extends ConsumerState<BannersWidget> {
  late int currentPageItem;

  @override
  void initState() {
    super.initState();
    currentPageItem = 0;
    Future.delayed(const Duration(milliseconds: 200), () async {
     await ref.read(bannersNotifierProvider.notifier).fetchAllBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.read(toastMessageProvider).initialMessage(context);
    final state = ref.watch(bannersNotifierProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            width: double.infinity,
            height: 175,
            color: AppColor.whiteColor,
            child: state.isLoading
                ? Center(child: circlePrimaryLoading())
                : state.hasData
                    ? CarouselSlider.builder(
                        itemCount: state.bannerList.length,
                        itemBuilder: (BuildContext context, int index,
                            int pageViewIndex) {
                          final item = state.bannerList[index];
                          return GestureDetector(
                            onTap: () => _jumpTo(item.bannerLink),
                            child: cacheImageNetwork(item.imageUrl,
                                width: double.infinity, height: 175),
                          );
                        },
                        options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 600),
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentPageItem = index;
                              });
                            }),
                      )
                    : Center(
                        child: Text(
                          state.message,
                          style:
                              stylePrimary(size: 14, weight: FontWeight.w400),
                        ),
                      ),
          ),
        ),
        Positioned(
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
        ),
      ],
    );
  }

  _jumpTo(String link) async {

  }
}
