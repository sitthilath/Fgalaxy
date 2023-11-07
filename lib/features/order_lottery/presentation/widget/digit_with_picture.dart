import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import '../../../../../../shared/style/text_style.dart';
import '../../../buy_lottery/presentation/providers/lotteries_treatise_provider.dart';

class DigitWithPicture extends ConsumerWidget {
  final String digits;
  const DigitWithPicture( {required this.digits,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String lastTwoCharacters = digits.length > 2 ? digits.substring(digits.length - 2) : digits;
    final filterLotteriesTreatise = ref.watch(lotteriesTreatiseNotifierProvider).filterLotteriesTreatise.where((element) => element.digits.any((item) => item.digit.contains(lastTwoCharacters))).first;
    return Padding(
      padding: const EdgeInsets.only(bottom:3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          cacheImageNetwork("${filterLotteriesTreatise.imageUrl}",width: 50,height: 32,isContain: true),
          widthBox(10),
          Padding(
            padding: const EdgeInsets.only(top:4.0),
            child: Text(
              digits,
              style:
                  styleBlack(size: 14, weight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );


  }
}
