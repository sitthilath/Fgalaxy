import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/splash_provider.dart';
import 'package:galaxy_18_lottery_app/features/splash/presentation/providers/state/splash_state.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(splashStateNotifierProvider.notifier).initialApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(splashStateNotifierProvider);
    ref.read(splashStateNotifierProvider.notifier).context = context;
    ref.read(themeProvider).setColors = [
      HexColor('#499ED4'),
      HexColor('#27398D'),
    ];
    ref.listen(splashStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next is Accepted) {
        Future.delayed(const Duration(seconds: 5), ()async {
          AutoRouter.of(context)
              .pushAndPopUntil(NavigatorRoute(), predicate: (_) => false);
        });
      } else if (next is InvalidToken) {
        Future.delayed(const Duration(seconds: 5), ()async {
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
        });
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
            Image.asset(
              AppConstants.logoGalaxy18,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              gaplessPlayback: true,
            ),
            heightBox(20),
            state.maybeMap(
                noInternet: (_) => _retryConnectInternet(),
                orElse: () => heightBox(0)),
          ],
        ),
      )),
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
        child: Text('ລອງອີກຄັ້ງ',
            style: styleWhite(size: 14, weight: FontWeight.w400)),
      ),
    );
  }
}
