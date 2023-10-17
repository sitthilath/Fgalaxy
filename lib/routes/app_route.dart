import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: OTPRoute.page),
    AutoRoute(page: NavigatorRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LotteryResultRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: InformationRoute.page),
    AutoRoute(page: InformationDetailRoute.page),
    AutoRoute(page: DreamTreatiseRoute.page),
    AutoRoute(page: DreamTreatiseDetailRoute.page),
    AutoRoute(page: LoginWithOTP.page),
    AutoRoute(page: BuyLotteriesRoute.page),
    AutoRoute(page: ModernDigitsRoute.page),
  ];
}
