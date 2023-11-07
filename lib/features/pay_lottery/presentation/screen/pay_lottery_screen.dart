import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/providers/pay_lottery_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/screen/table_lottery_list_screen.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/utils/formaters/number_formater.dart';
import '../../../../shared/utils/localization_text.dart';

@RoutePage()
class PayLotteryScreen extends ConsumerStatefulWidget {
  static const String routeName = '/payLotteryScreen';
  const PayLotteryScreen({super.key});

  @override
  ConsumerState createState() => _PayLotteryScreenState();
}

class _PayLotteryScreenState extends ConsumerState<PayLotteryScreen> {

  @override
  Widget build(BuildContext context) {



    final state = ref.watch(payLotteryNotifierProvider);

    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:  SharedAppbar(
          title: Txt.t(context, "payment"),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
          color: Colors.white,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppConstants.laoLotteryLogo,width: 48,),
                  widthBox(13.5),
                  Image.asset(AppConstants.galaxyBlueLogo,width: 145.5,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Txt.t(context,"ministry_of_finance"),
                    style: styleBlack(size: 12, weight: FontWeight.w400),
                  ),
                  widthBox(4.5),
                  Text(
                    "|",
                    style: styleBlack(size: 12, weight: FontWeight.w400),
                  ),
                  widthBox(4.5),
                  Text(
                    Txt.t(context, "lao_lottery"),
                    style: styleBlack(size: 12, weight: FontWeight.w400),
                  ),
                  widthBox(4.5),
                  Text(
                    "|",
                    style: styleBlack(size: 12, weight: FontWeight.w400),
                  ),
                  widthBox(4.5),
                  Text(
                    "GALAXY 18 lotto",
                    style: styleBlack(size: 12, weight: FontWeight.w400),
                  ),
                ],
              ),
              heightBox(17),
              const TableLotteryListScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding:const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom:12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Txt.t(context, "all_total"),
                        style: styleOption(
                          color: const Color(0xFF252525),
                          size: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Text(
                      '${nFormat(state.total)} ${Txt.t(context, "kip")}',
                      style: styleOption(
                        color: const Color(0xFF002FB2),
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton.icon(
                icon: Image.asset(AppConstants.bcelOneLogo,width: 28,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB31111),
                    fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0), // Adjust the radius as needed
                    ),
                  ),
                  onPressed: (){

                    AutoRouter.of(context).push(const PaymentHistoryRoute());

                  }, label: Text("${Txt.t(context, "pay_with")} BCEL One",style: styleWhite(size: 14,weight: FontWeight.w600),))
            ],
          ),
        ),
      ),
    );
  }
}
