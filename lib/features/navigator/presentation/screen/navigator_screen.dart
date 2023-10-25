import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/screen/home_screen.dart';
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_screen.dart';
import 'package:galaxy_18_lottery_app/features/lottery-results/presentation/screen/lottery_result_screen.dart';
import 'package:galaxy_18_lottery_app/features/navigator/presentation/widgets/buy_lottery_button.dart';
import 'package:galaxy_18_lottery_app/features/navigator/presentation/widgets/menu_items.dart';
import 'package:galaxy_18_lottery_app/features/profile/presentation/screen/profile_screen.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class NavigatorScreen extends ConsumerStatefulWidget {
  static const String routeName = '/navigatorRoute';

  const NavigatorScreen({super.key, this.pageIndex = 0});

  final int pageIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NavigatorState();
}

class NavigatorState extends ConsumerState<NavigatorScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const LotteryResultScreen(),
    const InformationScreen(),
    const ProfileScreen(),
  ];
  late Widget currentScreen;
  PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    currentScreen = screens[widget.pageIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeApp(child: PageStorage(bucket: bucket, child: currentScreen)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BuyLotteryButton(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    return Container(
      width: double.infinity,
      height: 78,
      color: AppColor.primaryColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(18.0, 13.0, 18.0, 8.0),
      child: Row(
        children: [
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menuBottomItem(
                  icon: MenuIcons.home,
                  title: Txt.t(context, "home"), // ໜ້າຫຼັກ
                  index: 0,
                  onTap: () {
                    setState(() {
                      currentScreen = screens[0];
                    });
                  },
                  currentScreen: currentScreen,
                  screens: screens,
                ),
                menuBottomItem(
                  icon: MenuIcons.lotteryResult,
                  title: Txt.t(context, 'lottery_result'), //ຜົນຫວຍ
                  index: 1,
                  onTap: () {
                    setState(() {
                      currentScreen = screens[1];
                    });
                  },
                  currentScreen: currentScreen,
                  screens: screens,
                ),
              ],
            ),
          ),
          Expanded(child: heightBox(0)),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                menuBottomItem(
                  icon: MenuIcons.information,
                  title: Txt.t(context, 'information'), //ຂ່າວສານ
                  index: 2,
                  onTap: () {
                    setState(() {
                      currentScreen = screens[2];
                    });
                  },
                  currentScreen: currentScreen,
                  screens: screens,
                ),
                menuBottomItem(
                  icon: MenuIcons.profile,
                  title: Txt.t(context, "profile"), //ໂປຣຟາຍ
                  index: 3,
                  onTap: () {
                    setState(() {
                      currentScreen = screens[3];
                    });
                  },
                  currentScreen: currentScreen,
                  screens: screens,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
