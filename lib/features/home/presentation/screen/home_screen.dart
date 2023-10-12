import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/banners/presentation/widget/banners_widget.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/widgets/customer_profile.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/widgets/home_appbar.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/widgets/lottery_chance.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/widgets/menus_widget.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/widgets/user_referal.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const HomeAppbar(hasUnreadMessage: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(
            children: [
              const CustomerProfile(),
              heightBox(15),
              const UserReferral(),
              heightBox(15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const LotteryChance(),
                    heightBox(15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColor.grayColor,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(15),
              const MenusWidget(),
              heightBox(15),
              const BannersWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
