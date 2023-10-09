import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/splash_provider.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/constants/app_constants.dart';
import 'package:galaxy_18_lottery_app/shared/hex_color.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/theme/provider/theme_provider.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  static const String routeName = '/splashRoute';

  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SplashState();
}

class SplashState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      await ref.read(splashStateNotifierProvider.notifier).initialApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashStateNotifierProvider);
    ref.read(splashStateNotifierProvider.notifier).context = context;
    ref.read(themeProvider).setColors = [
      HexColor('#4EB1F1'),
      HexColor('#2764C5'),
      HexColor('#1E1588'),
    ];
    ref.listen(splashStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next is Accepted) {
        AutoRouter.of(context).pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
      } else if (next is InvalidToken) {
        AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
      }
    });

    return Scaffold(
      body: ThemeApp(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 68,
              child: Image.asset(AppConstants.appLogo, fit: BoxFit.cover),
            ),
            heightBox(20),
            state.maybeMap(
                loading: (_) => _loading(), orElse: () => heightBox(0)),
            state.maybeMap(noInternet: (_) => _retryConnectInternet(),orElse: () => heightBox(0)),
          ],
        ),
      )),
    );
  }

  _loading() {
    return LinearProgressIndicator(
      minHeight: 4,
      valueColor: AlwaysStoppedAnimation(AppColor.primaryColor),
      backgroundColor: AppColor.primaryColor.withOpacity(.5),
    );
  }

 Widget _retryConnectInternet() {
    return InkWell(
      onTap: () {
        ref.read(splashStateNotifierProvider.notifier).initialApp();
      },
      child: Container(
        width: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text('ລອງອີກຄັ້ງ', style: styleWhite(size: 14, weight: FontWeight.w400)),
      ),
    );
  }
}
