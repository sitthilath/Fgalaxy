// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_screen.dart'
    as _i3;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/otp_screen.dart'
    as _i6;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/register_screen.dart'
    as _i8;
import 'package:galaxy_18_lottery_app/features/home/presentation/screen/home_screen.dart'
    as _i1;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_screen.dart'
    as _i2;
import 'package:galaxy_18_lottery_app/features/lottery-results/presentation/screen/lottery_result_screen.dart'
    as _i4;
import 'package:galaxy_18_lottery_app/features/navigator/presentation/screen/navigator_screen.dart'
    as _i5;
import 'package:galaxy_18_lottery_app/features/profile/presentation/screen/profile_screen.dart'
    as _i7;
import 'package:galaxy_18_lottery_app/features/splash/presentation/screens/splash_screen.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    InformationRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InformationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    LotteryResultRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LotteryResultScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NavigatorScreen(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OTPScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InformationScreen]
class InformationRoute extends _i10.PageRouteInfo<void> {
  const InformationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          InformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LotteryResultScreen]
class LotteryResultRoute extends _i10.PageRouteInfo<void> {
  const LotteryResultRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LotteryResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'LotteryResultRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NavigatorScreen]
class NavigatorRoute extends _i10.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i11.Key? key,
    int pageIndex = 0,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          NavigatorRoute.name,
          args: NavigatorRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';

  static const _i10.PageInfo<NavigatorRouteArgs> page =
      _i10.PageInfo<NavigatorRouteArgs>(name);
}

class NavigatorRouteArgs {
  const NavigatorRouteArgs({
    this.key,
    this.pageIndex = 0,
  });

  final _i11.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i6.OTPScreen]
class OTPRoute extends _i10.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i11.Key? key,
    required String phoneNumber,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i10.PageInfo<OTPRouteArgs> page =
      _i10.PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
  });

  final _i11.Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterScreen]
class RegisterRoute extends _i10.PageRouteInfo<void> {
  const RegisterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i10.PageRouteInfo<void> {
  const SplashRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
