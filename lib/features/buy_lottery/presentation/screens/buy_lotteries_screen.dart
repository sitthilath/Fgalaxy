import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/screens/animal_digits_screen.dart';
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/screens/modern_digits_screen.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/theme/provider/theme_provider.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/buy_lottery_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class BuyLotteriesScreen extends ConsumerWidget {
  static const String routeName = '/buyLotteriesScreen';

  const BuyLotteriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeColor = ref.watch(themeProvider).backgroundGradient();
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const BuyLotteryAppbar(title: 'buy_lottery'),
        body: DefaultTabController(
          animationDuration: const Duration(milliseconds: 200),
          length: 3,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(7.0),
                margin: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.whiteColor,
                ),
                child: TabBar(
                  tabs: [
                    Tab(text: Txt.t(context, 'modern_digits')),
                    Tab(text: Txt.t(context, 'animal_digits')),
                    Tab(text: Txt.t(context, 'bet_lottery')),
                  ],
                  indicator: BoxDecoration(
                    gradient: themeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  unselectedLabelColor: AppColor.blackColor,
                  labelStyle: styleBlack(size: 14, weight: FontWeight.w600),
                ),
              ),
              heightBox(20),
              Expanded(
                child: IntrinsicHeight(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const ModernDigitsScreen(),
                      const AnimalDigitsScreen(),
                      Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
