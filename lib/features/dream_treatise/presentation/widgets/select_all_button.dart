import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';

class SelectAll extends StatelessWidget {
  const SelectAll({Key? key, required this.onSelect, required this.isSelectAll}) : super(key: key);

  final Function()onSelect;
  final bool isSelectAll;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        InkWell(
          onTap: onSelect,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.grayColor,
                width: isSelectAll ? 4 : 2,
              ),
              borderRadius: BorderRadius.circular(20),
              color:isSelectAll
                  ? AppColor.primaryColor
                  : AppColor.whiteColor,
            ),
          ),
        ),
        widthBox(8),
        Text(
          Txt.t(context, 'select_all'),
          style:
          styleBlack(size: 14, weight: FontWeight.w400),
        ),
      ],
    );
  }
}
