import 'package:flutter/material.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';

class SimpleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppbar(
      {Key? key,
      required this.title,
      this.isCenter = true,
      this.color = Colors.transparent})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  final String title;
  final bool isCenter;
  final Color color;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: styleWhite(size: 18, weight: FontWeight.w600)),
      centerTitle: isCenter,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      backgroundColor: color,
      scrolledUnderElevation: 6.0,
      shadowColor: Colors.transparent,
    );
  }
}
