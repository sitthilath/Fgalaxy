import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import '../../../../../shared/style/text_style.dart';
import '../../../buy_lottery/presentation/providers/lotteries_treatise_provider.dart';

class DigitWithCirclePicture extends ConsumerWidget {
  final String digits;
  final MainAxisAlignment rowMainAxisAlignment;
  final double boxWidth;
  const DigitWithCirclePicture( {this.boxWidth = 0.0,this.rowMainAxisAlignment = MainAxisAlignment.start,required this.digits,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String lastTwoCharacters = digits.length > 2 ? digits.substring(digits.length - 2) : digits;
    final filterLotteriesTreatise = ref.watch(lotteriesTreatiseNotifierProvider).filterLotteriesTreatise.where((element) => element.digits.any((item) => item.digit.contains(lastTwoCharacters))).first;
    return Padding(
      padding: const EdgeInsets.only(left: 12,bottom:3.5),
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        children: [

          Container(
              width: 23,
              height: 23,
              decoration: const ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(width: 0.72, color: Color(0xFF4EB1F1)),
                ),
              ),
              child: cacheImageNetwork("${filterLotteriesTreatise.imageUrl}",width: 50,height: 32,isContain: true)),

          widthBox(boxWidth),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text(
              digits,
              style:
                  styleBlack(size: 12, weight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );


  }
}
