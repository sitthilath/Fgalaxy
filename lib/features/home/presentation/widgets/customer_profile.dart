import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/features/home/presentation/providers/user_local_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/formaters/number_formater.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class CustomerProfile extends ConsumerStatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CustomerProfileState();
}

class CustomerProfileState extends ConsumerState<CustomerProfile> {
  late bool obscurePhone;

  @override
  void initState() {
    super.initState();
    obscurePhone = false;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userLocalProvider);
    return user.maybeMap(
        data: (user) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 47,
                        height: 47,
                        color: AppColor.yellowColor,
                        child: Image.asset(
                          AppConstants.avatar,
                        ),
                      ),
                    ),
                    widthBox(10),
                    Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.value!.userData.username!.isEmpty
                              ? 'Customer'
                              : '${user.value?.userData.username}',
                          style: styleWhite(size: 14, weight: FontWeight.w400),
                        ),
                        heightBox(6),
                        Flex(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              obscurePhone
                                  ? '*** **** ****'
                                  : '${user.value?.userData.phone.toString()}',
                              style:
                                  styleWhite(size: 14, weight: FontWeight.w400),
                            ),
                            widthBox(6),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  obscurePhone = !obscurePhone;
                                });
                              },
                              child: SvgPicture.asset(
                                obscurePhone
                                    ? AppConstants.disability
                                    : AppConstants.visibility,
                                color: AppColor.whiteColor,
                                width: 18,
                                height: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        SvgPicture.asset(
                          AppConstants.redeem,
                          width: 18,
                          height: 18,
                        ),
                        widthBox(6),
                        Text(
                          Txt.t(context, 'points'),
                          style: styleWhite(size: 14, weight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          nCompact(0),
                          style: styleWhite(size: 16, weight: FontWeight.w800),
                        ),
                        widthBox(6),
                        SvgPicture.asset(
                          AppConstants.arrowForward,
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
        orElse: () => heightBox(0));
  }
}
