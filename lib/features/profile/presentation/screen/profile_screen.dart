import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget{
  static const String routeName ="/profileScreen";

  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfileState();
}

class ProfileState extends ConsumerState<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeApp(child: Center(
        child: Text(
          "lotteryResultScreen",
          style: styleWhite(),
        ),
      ),),
    );
  }

}