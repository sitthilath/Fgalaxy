import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class UserReferral extends ConsumerStatefulWidget {
  const UserReferral({Key? key}) : super(key: key);

  @override
  ConsumerState<UserReferral> createState() => _UserReferralState();
}

class _UserReferralState extends ConsumerState<UserReferral> {
  bool isCopied = false;

  @override
  void initState() {
    super.initState();
    isCopied = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SvgPicture.asset(
              AppConstants.verified,
              width: 18,
              height: 18,
            ),
          ),
          widthBox(10),
          Expanded(
            child: Flex(
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Txt.t(context, 'your_referral_code'),
                      style: stylePrimary(size: 16, weight: FontWeight.w800),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            '372977',
                            style:
                                stylePrimary(size: 17, weight: FontWeight.w800),
                            maxLines: 1,
                          ),
                          widthBox(6),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCopied = true;
                              });
                              Future.delayed(const Duration(seconds: 1),
                                  () async {
                                setState(() {
                                  isCopied = false;
                                });
                              });
                            },
                            child: SvgPicture.asset(
                              isCopied ? AppConstants.check : AppConstants.copy,
                              color: isCopied
                                  ? AppColor.successColor
                                  : AppColor.primaryColor,
                              width: 18,
                              height: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                    "${Txt.t(context, 'suggest_your_friends_for_get_point')} 0.5% ${Txt.t(context, 'of_sales')}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
