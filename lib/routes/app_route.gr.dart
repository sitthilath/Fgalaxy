// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_screen.dart'
    as _i4;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/otp_screen.dart'
    as _i7;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/register_screen.dart'
    as _i9;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/forgot_password_screen.dart'
    as _i1;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/reset_password_screen.dart'
    as _i10;
import 'package:galaxy_18_lottery_app/features/home/presentation/screen/home_screen.dart'
    as _i2;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_screen.dart'
    as _i3;
import 'package:galaxy_18_lottery_app/features/lottery-results/presentation/screen/lottery_result_screen.dart'
    as _i5;
import 'package:galaxy_18_lottery_app/features/navigator/presentation/screen/navigator_screen.dart'
    as _i6;
import 'package:galaxy_18_lottery_app/features/profile/presentation/screen/profile_screen.dart'
    as _i8;
import 'package:galaxy_18_lottery_app/features/splash/presentation/screens/splash_screen.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    InformationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.InformationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    LotteryResultRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LotteryResultScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.NavigatorScreen(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OTPScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ResetPasswordScreen(
          args.phoneNumber,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i12.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.InformationScreen]
class InformationRoute extends _i12.PageRouteInfo<void> {
  const InformationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LotteryResultScreen]
class LotteryResultRoute extends _i12.PageRouteInfo<void> {
  const LotteryResultRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LotteryResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'LotteryResultRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NavigatorScreen]
class NavigatorRoute extends _i12.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i13.Key? key,
    int pageIndex = 0,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          NavigatorRoute.name,
          args: NavigatorRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';

  static const _i12.PageInfo<NavigatorRouteArgs> page =
      _i12.PageInfo<NavigatorRouteArgs>(name);
}

class NavigatorRouteArgs {
  const NavigatorRouteArgs({
    this.key,
    this.pageIndex = 0,
  });

  final _i13.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i7.OTPScreen]
class OTPRoute extends _i12.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i13.Key? key,
    required String phoneNumber,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i12.PageInfo<OTPRouteArgs> page =
      _i12.PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i13.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterRoute extends _i12.PageRouteInfo<void> {
  const RegisterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ResetPasswordScreen]
class ResetPasswordRoute extends _i12.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String phoneNumber,
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i12.PageInfo<ResetPasswordRouteArgs> page =
      _i12.PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.phoneNumber,
    this.key,
  });

  final String phoneNumber;

  final _i13.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
