import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/dream_treatise/dream_treatise_model.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';

class AnimalLotteryItem extends StatelessWidget {
  const AnimalLotteryItem({Key? key, required this.digits}) : super(key: key);
  final Digits digits;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.fillColor,
          ),
          child: Text(
            digits.digit,
            style: styleBlack(
              size: 14,
              weight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class RiskLotteryItem extends StatelessWidget {
  const RiskLotteryItem({Key? key, required this.digits}) : super(key: key);
  final DreamDigits digits;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.fillColor,
            ),
            child: Text(
              digits.digit,
              style: styleBlack(
                size: 14,
                weight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
