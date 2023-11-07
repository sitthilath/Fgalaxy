// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_screen.dart'
    as _i10;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_with_otp_screen.dart'
    as _i11;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/otp_screen.dart'
    as _i15;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/register_screen.dart'
    as _i19;
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/screens/animal_digits_screen.dart'
    as _i1;
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/screens/buy_lotteries_screen.dart'
    as _i3;
import 'package:galaxy_18_lottery_app/features/buy_lottery/presentation/screens/modern_digits_screen.dart'
    as _i13;
import 'package:galaxy_18_lottery_app/features/buy_lottery/tab_bet_lottery/bet_lottery/presentation/screen/bet_lottery_screen.dart'
    as _i2;
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/screens/dream_treatise_detail_screen.dart'
    as _i4;
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/screens/dream_treatise_screen.dart'
    as _i5;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/forgot_password_screen.dart'
    as _i6;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/reset_password_screen.dart'
    as _i20;
import 'package:galaxy_18_lottery_app/features/home/presentation/screen/home_screen.dart'
    as _i7;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_detail_screen.dart'
    as _i8;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_screen.dart'
    as _i9;
import 'package:galaxy_18_lottery_app/features/lottery-results/presentation/screen/lottery_result_screen.dart'
    as _i12;
import 'package:galaxy_18_lottery_app/features/navigator/presentation/screen/navigator_screen.dart'
    as _i14;
import 'package:galaxy_18_lottery_app/features/pay_lottery/presentation/screen/pay_lottery_screen.dart'
    as _i16;
import 'package:galaxy_18_lottery_app/features/payment_history/presentation/screen/payment_history_screen.dart'
    as _i17;
import 'package:galaxy_18_lottery_app/features/profile/presentation/screen/profile_screen.dart'
    as _i18;
import 'package:galaxy_18_lottery_app/features/splash/presentation/screens/splash_screen.dart'
    as _i21;
import 'package:galaxy_18_lottery_app/shared/domain/models/infomation/information_model.dart'
    as _i24;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    AnimalDigitsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AnimalDigitsScreen(),
      );
    },
    BetLotteryRoute.name: (routeData) {
      final args = routeData.argsAs<BetLotteryRouteArgs>(
          orElse: () => const BetLotteryRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BetLotteryScreen(key: args.key),
      );
    },
    BuyLotteriesRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BuyLotteriesScreen(),
      );
    },
    DreamTreatiseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DreamTreatiseDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.DreamTreatiseDetailScreen(
          args.id,
          key: args.key,
        ),
      );
    },
    DreamTreatiseRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DreamTreatiseScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    InformationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<InformationDetailRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.InformationDetailScreen(
          key: args.key,
          information: args.information,
        ),
      );
    },
    InformationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.InformationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LoginScreen(),
      );
    },
    LoginWithOTP.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LoginWithOTP(),
      );
    },
    LotteryResultRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.LotteryResultScreen(),
      );
    },
    ModernDigitsRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ModernDigitsScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.NavigatorScreen(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.OTPScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          isLogin: args.isLogin,
        ),
      );
    },
    PayLotteryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PayLotteryScreen(),
      );
    },
    PaymentHistoryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PaymentHistoryScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.ResetPasswordScreen(
          args.phoneNumber,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AnimalDigitsScreen]
class AnimalDigitsRoute extends _i22.PageRouteInfo<void> {
  const AnimalDigitsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          AnimalDigitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnimalDigitsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BetLotteryScreen]
class BetLotteryRoute extends _i22.PageRouteInfo<BetLotteryRouteArgs> {
  BetLotteryRoute({
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          BetLotteryRoute.name,
          args: BetLotteryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BetLotteryRoute';

  static const _i22.PageInfo<BetLotteryRouteArgs> page =
      _i22.PageInfo<BetLotteryRouteArgs>(name);
}

class BetLotteryRouteArgs {
  const BetLotteryRouteArgs({this.key});

  final _i23.Key? key;

  @override
  String toString() {
    return 'BetLotteryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.BuyLotteriesScreen]
class BuyLotteriesRoute extends _i22.PageRouteInfo<void> {
  const BuyLotteriesRoute({List<_i22.PageRouteInfo>? children})
      : super(
          BuyLotteriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuyLotteriesRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DreamTreatiseDetailScreen]
class DreamTreatiseDetailRoute
    extends _i22.PageRouteInfo<DreamTreatiseDetailRouteArgs> {
  DreamTreatiseDetailRoute({
    required int id,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          DreamTreatiseDetailRoute.name,
          args: DreamTreatiseDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DreamTreatiseDetailRoute';

  static const _i22.PageInfo<DreamTreatiseDetailRouteArgs> page =
      _i22.PageInfo<DreamTreatiseDetailRouteArgs>(name);
}

class DreamTreatiseDetailRouteArgs {
  const DreamTreatiseDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final _i23.Key? key;

  @override
  String toString() {
    return 'DreamTreatiseDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i5.DreamTreatiseScreen]
class DreamTreatiseRoute extends _i22.PageRouteInfo<void> {
  const DreamTreatiseRoute({List<_i22.PageRouteInfo>? children})
      : super(
          DreamTreatiseRoute.name,
          initialChildren: children,
        );

  static const String name = 'DreamTreatiseRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.InformationDetailScreen]
class InformationDetailRoute
    extends _i22.PageRouteInfo<InformationDetailRouteArgs> {
  InformationDetailRoute({
    _i23.Key? key,
    required _i24.Information information,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          InformationDetailRoute.name,
          args: InformationDetailRouteArgs(
            key: key,
            information: information,
          ),
          initialChildren: children,
        );

  static const String name = 'InformationDetailRoute';

  static const _i22.PageInfo<InformationDetailRouteArgs> page =
      _i22.PageInfo<InformationDetailRouteArgs>(name);
}

class InformationDetailRouteArgs {
  const InformationDetailRouteArgs({
    this.key,
    required this.information,
  });

  final _i23.Key? key;

  final _i24.Information information;

  @override
  String toString() {
    return 'InformationDetailRouteArgs{key: $key, information: $information}';
  }
}

/// generated route for
/// [_i9.InformationScreen]
class InformationRoute extends _i22.PageRouteInfo<void> {
  const InformationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          InformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoginWithOTP]
class LoginWithOTP extends _i22.PageRouteInfo<void> {
  const LoginWithOTP({List<_i22.PageRouteInfo>? children})
      : super(
          LoginWithOTP.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithOTP';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i12.LotteryResultScreen]
class LotteryResultRoute extends _i22.PageRouteInfo<void> {
  const LotteryResultRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LotteryResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'LotteryResultRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ModernDigitsScreen]
class ModernDigitsRoute extends _i22.PageRouteInfo<void> {
  const ModernDigitsRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ModernDigitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ModernDigitsRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NavigatorScreen]
class NavigatorRoute extends _i22.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i23.Key? key,
    int pageIndex = 0,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          NavigatorRoute.name,
          args: NavigatorRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';

  static const _i22.PageInfo<NavigatorRouteArgs> page =
      _i22.PageInfo<NavigatorRouteArgs>(name);
}

class NavigatorRouteArgs {
  const NavigatorRouteArgs({
    this.key,
    this.pageIndex = 0,
  });

  final _i23.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i15.OTPScreen]
class OTPRoute extends _i22.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i23.Key? key,
    required String phoneNumber,
    bool isLogin = false,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            isLogin: isLogin,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i22.PageInfo<OTPRouteArgs> page =
      _i22.PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
    this.isLogin = false,
  });

  final _i23.Key? key;

  final String phoneNumber;

  final bool isLogin;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber, isLogin: $isLogin}';
  }
}

/// generated route for
/// [_i16.PayLotteryScreen]
class PayLotteryRoute extends _i22.PageRouteInfo<void> {
  const PayLotteryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PayLotteryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PayLotteryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PaymentHistoryScreen]
class PaymentHistoryRoute extends _i22.PageRouteInfo<void> {
  const PaymentHistoryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PaymentHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentHistoryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RegisterScreen]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.ResetPasswordScreen]
class ResetPasswordRoute extends _i22.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String phoneNumber,
    _i23.Key? key,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i22.PageInfo<ResetPasswordRouteArgs> page =
      _i22.PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.phoneNumber,
    this.key,
  });

  final String phoneNumber;

  final _i23.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
