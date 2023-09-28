import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class InformationScreen extends ConsumerStatefulWidget {
  static const String routeName = "/informationScreen";
  const InformationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => InformationState();
}

class InformationState extends ConsumerState<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeApp(
        child: Text(
          "Home",
          style: styleWhite(),
        ),
      ),
    );
  }
}
