import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/features/table_lottery_list/presentation/screen/table_lottery_list_screen.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/style/text_style.dart';
import '../../../../shared/utils/app_color.dart';
import '../../../../shared/utils/localization_text.dart';
import '../../../../shared/widgets/help_widget.dart';
import '../../../buy_lottery/presentation/widgets/separator.dart';

@RoutePage()
class PaymentHistoryScreen extends ConsumerWidget {
  static const String routeName = '/paymentHistoryScreen';

  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: () => context.router.back(),
              child: Container(
                width: 45,
                height: 45,
                alignment: Alignment.center,
                child: SvgPicture.asset(AppConstants.leadingIcon,
                    width: 26, height: 26),
              ),
            ),
          ),
          title: Text(Txt.t(context, "buy_lottery"),
              style: styleWhite(size: 18, weight: FontWeight.w600)),
          centerTitle: false,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: const EdgeInsets.only(top: 22),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0F3D3D3D),
                blurRadius: 14,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.laoLotteryLogo,
                    width: 48,
                  ),
                  widthBox(13.5),
                  Image.asset(
                    AppConstants.galaxyBlueLogo,
                    width: 145.5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Txt.t(context, "ministry_of_finance"),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: MySeparator(
                  color: AppColor.borderColor,
                ),
              ),
              heightBox(17),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppConstants.circleCheck,
                    width: 23.5,
                    height: 23.5,
                  ),
                  widthBox(12),
                  Text(
                    Txt.t(context, "list_completed"),
                    style: styleOption(
                        color: const Color(0xFF35A700),
                        size: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              heightBox(10),
              Center(
                child: Text(
                  "${Txt.t(context, "buy_at")} 08-09-2023 15:23:40",
                  style: styleOption(
                      color: const Color(0xFF404040),
                      size: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              heightBox(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ເລກບິນຫວຍ',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '1829738298378002',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  heightBox(9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ຊຳລະຜ່ານ',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'BCEL One',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  heightBox(9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ເບີໂທຕິດຕໍ່',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '020 5578 0987',
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  heightBox(20),
                  MySeparator(
                    color: AppColor.borderColor,
                  ),
                  heightBox(11),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Txt.t(context, "all_total"),
                        style: styleOption(
                            color: Colors.black,
                            size: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '10,000 ${Txt.t(context, "kip")}',
                        style: styleOption(
                            color: AppColor.primaryBlue,
                            size: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                ]),
              ),
              heightBox(17),
              const TableLotteryListScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(18, 15, 18, 24),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.sizeOf(context).width, 48),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Adjust the value to change the corner radius
              ),
            ),
            onPressed: () {},
            child: Text(
              Txt.t(context, "done"),
              style: stylePrimary(size: 14, weight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
