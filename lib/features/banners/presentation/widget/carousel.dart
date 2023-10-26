import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/current_page_item_provider.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/state/banner_state.dart';
import 'package:galaxy_18_lottery_app/shared/utils/read_url.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

Widget bannerCarousel(WidgetRef ref, BannerState state){
  return CarouselSlider.builder(
    itemCount: state.bannerList.length,
    itemBuilder: (BuildContext context, int index, int pageViewIndex) {
      final item = state.bannerList[ref.watch(currentPageItemProvider)];
      return GestureDetector(
        onTap: () async {
          await readLink(item.bannerLink);
        },
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
          ref.read(currentPageItemProvider.notifier).update((state) => state = index);
        }),
  );
}