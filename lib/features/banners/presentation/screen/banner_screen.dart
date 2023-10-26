import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/providers/banners_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/widget/banner_indicator.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/widget/carousel.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/loadings/circle_loading.dart';

class BannerView extends ConsumerWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ? Center(child: circleLoading(color: AppColor.primaryColor))
                : state.hasData
                ? bannerCarousel(ref, state)
                : Center(
              child: Text(
                state.message,
                style:
                stylePrimary(size: 14, weight: FontWeight.w400),
              ),
            ),
          ),
        ),
        indicator(ref, state),
      ],
    );
  }
}
