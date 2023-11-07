import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import '../../../../../../shared/style/text_style.dart';
import '../../../buy_lottery/presentation/providers/lotteries_treatise_provider.dart';

class AnimalWithPicture extends ConsumerWidget {
  final String digits;
  const AnimalWithPicture( {required this.digits,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final filterLotteriesTreatise = ref.watch(lotteriesTreatiseNotifierProvider).filterLotteriesTreatise.where((element) => element.digits.any((item) => item.digit.contains(digits))).first;
    return  Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      width: 45,
      height: 22,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF4DA9E3),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2.5),
            padding: const EdgeInsets.fromLTRB(2.5,0.5,2.5,0),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(0.04, -1.00),
                end: Alignment(-0.04, 1),
                colors: [Color(0xFF4DA9E3), Color(0xFF3664AB)],
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            child:Text(
              digits,
              style:
              styleWhite(size: 10, weight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          cacheImageNetwork("${filterLotteriesTreatise.imageUrl}",width: 18,height: 16,isContain: true),
        ],
      ),
    );
  }
}
