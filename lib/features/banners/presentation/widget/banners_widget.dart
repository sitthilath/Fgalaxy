import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/services/banners_cache_service/domain/providers/current_banners_provider.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final banners = ref.watch(currentBannersProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    return banners.when(
      data: (bannerList) => Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: double.infinity,
              height: 175,
              color: AppColor.whiteColor,
              child: CarouselSlider.builder(
                itemCount: bannerList!.length,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) {
                  final item = bannerList[index];
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
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerList.map((item) {
                final index = bannerList.indexOf(item);
                return AnimatedContainer(
                  width: currentPageItem == index ? 25: 8,
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
      ),
      error: (err, stack) => Text("$err"),
      loading: () => const CircularProgressIndicator(),
    );
  }

  _jumpTo(String link) async {
    String url = '';
    if(link.contains('facebook.com')){
     if(Platform.isAndroid){
       setState(() {
         url = "fb://facewebmodal/f?href=$link";
       });
     }
     if(await canLaunchUrl(Uri.parse(url))){
       await launchUrl(Uri.parse(url));
     }else {
      await ref.read(toastMessageProvider).messageError(message: Txt.t(context, 'can_not_open_link'));
     }
    }else {
      if(await canLaunchUrl(Uri.parse(link))){
        await launchUrl(
          Uri.parse(link),
        );
      }else{
        await ref.read(toastMessageProvider).messageError(message: Txt.t(context, 'can_not_open_link'));
        print(
            'There was a problem to open the url: $link');
      }
    }
  }
}
