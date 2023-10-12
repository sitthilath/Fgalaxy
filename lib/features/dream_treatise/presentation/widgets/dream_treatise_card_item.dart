import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/hex_color.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class DreamTreatiseCardItem extends StatelessWidget {
  const DreamTreatiseCardItem({Key? key, required this.dreamTreatise})
      : super(key: key);

  final DreamTreatise dreamTreatise;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AutoRouter.of(context).push(DreamTreatiseDetailRoute(id: dreamTreatise.id));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: AppColor.fillColor,
        ))),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flex(
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      HexColor('#16349C'),
                      HexColor('#143ED3'),
                      HexColor('#07A8DF')
                    ]),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(54),
                    child: dreamTreatise.lotteryTreatise.imageUrl == null
                        ? Image.asset(
                            AppConstants.error,
                            fit: BoxFit.cover,
                          )
                        : cacheImageNetwork(
                      dreamTreatise.lotteryTreatise.imageUrl,
                      isProfile: true,
                    ),
                  ),
                ),
                widthBox(12),
                Expanded(
                  child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dreamTreatise.lotteryTreatise.name,
                        style: styleBlack(size: 14, weight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      heightBox(4),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 12,
                        children: dreamTreatise.lotteryTreatise.digits
                            .map(
                              (digit) => Text(
                                digit.digit,
                                style: styleBlack(
                                    size: 14, weight: FontWeight.w500),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                  height: 12,
                  child: SvgPicture.asset(AppConstants.arrowForward,
                      color: AppColor.primaryColor, fit: BoxFit.contain),
                ),
              ],
            ),
            heightBox(14),
            Flex(
              direction: Axis.horizontal,
              children: [
                Text(
                  Txt.t(context, 'a_dream'),
                  style: stylePrimary(size: 14, weight: FontWeight.w500),
                ),
                widthBox(17),
                Expanded(
                  child: Text(
                    dreamTreatise.description,
                    style: styleBlack(size: 14, weight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            heightBox(12),
            Flex(
              direction: Axis.horizontal,
              children: [
                Text(
                  Txt.t(context, 'risk_number'),
                  style: stylePrimary(size: 14, weight: FontWeight.w500),
                  maxLines: 1,
                ),
                widthBox(17),
                Expanded(
                  child: Text(
                              dreamTreatise.toStringDigit(dreamTreatise.dreamDigits),
                              style:
                                  styleBlack(size: 14, weight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )

                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
