// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_screen.dart'
    as _i7;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/login_with_otp_screen.dart'
    as _i8;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/otp_screen.dart'
    as _i11;
import 'package:galaxy_18_lottery_app/features/authentication/presentation/screens/register_screen.dart'
    as _i13;
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/screens/dream_treatise_detail_screen.dart'
    as _i1;
import 'package:galaxy_18_lottery_app/features/dream_treatise/presentation/screens/dream_treatise_screen.dart'
    as _i2;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/forgot_password_screen.dart'
    as _i3;
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/screen/reset_password_screen.dart'
    as _i14;
import 'package:galaxy_18_lottery_app/features/home/presentation/screen/home_screen.dart'
    as _i4;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_detail_screen.dart'
    as _i5;
import 'package:galaxy_18_lottery_app/features/information/presentation/screens/information_screen.dart'
    as _i6;
import 'package:galaxy_18_lottery_app/features/lottery-results/presentation/screen/lottery_result_screen.dart'
    as _i9;
import 'package:galaxy_18_lottery_app/features/navigator/presentation/screen/navigator_screen.dart'
    as _i10;
import 'package:galaxy_18_lottery_app/features/profile/presentation/screen/profile_screen.dart'
    as _i12;
import 'package:galaxy_18_lottery_app/features/splash/presentation/screens/splash_screen.dart'
    as _i15;
import 'package:galaxy_18_lottery_app/shared/domain/models/infomation/information_model.dart'
    as _i18;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    DreamTreatiseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DreamTreatiseDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DreamTreatiseDetailScreen(
          args.id,
          key: args.key,
        ),
      );
    },
    DreamTreatiseRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DreamTreatiseScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    InformationDetailRoute.name: (routeData) {
      final args = routeData.argsAs<InformationDetailRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.InformationDetailScreen(
          key: args.key,
          information: args.information,
        ),
      );
    },
    InformationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InformationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginScreen(),
      );
    },
    LoginWithOTP.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginWithOTP(),
      );
    },
    LotteryResultRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LotteryResultScreen(),
      );
    },
    NavigatorRoute.name: (routeData) {
      final args = routeData.argsAs<NavigatorRouteArgs>(
          orElse: () => const NavigatorRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.NavigatorScreen(
          key: args.key,
          pageIndex: args.pageIndex,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OTPScreen(
          key: args.key,
          phoneNumber: args.phoneNumber,
          isLogin: args.isLogin,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RegisterScreen(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.ResetPasswordScreen(
          args.phoneNumber,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DreamTreatiseDetailScreen]
class DreamTreatiseDetailRoute
    extends _i16.PageRouteInfo<DreamTreatiseDetailRouteArgs> {
  DreamTreatiseDetailRoute({
    required int id,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          DreamTreatiseDetailRoute.name,
          args: DreamTreatiseDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DreamTreatiseDetailRoute';

  static const _i16.PageInfo<DreamTreatiseDetailRouteArgs> page =
      _i16.PageInfo<DreamTreatiseDetailRouteArgs>(name);
}

class DreamTreatiseDetailRouteArgs {
  const DreamTreatiseDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final _i17.Key? key;

  @override
  String toString() {
    return 'DreamTreatiseDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i2.DreamTreatiseScreen]
class DreamTreatiseRoute extends _i16.PageRouteInfo<void> {
  const DreamTreatiseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DreamTreatiseRoute.name,
          initialChildren: children,
        );

  static const String name = 'DreamTreatiseRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InformationDetailScreen]
class InformationDetailRoute
    extends _i16.PageRouteInfo<InformationDetailRouteArgs> {
  InformationDetailRoute({
    _i17.Key? key,
    required _i18.Information information,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          InformationDetailRoute.name,
          args: InformationDetailRouteArgs(
            key: key,
            information: information,
          ),
          initialChildren: children,
        );

  static const String name = 'InformationDetailRoute';

  static const _i16.PageInfo<InformationDetailRouteArgs> page =
      _i16.PageInfo<InformationDetailRouteArgs>(name);
}

class InformationDetailRouteArgs {
  const InformationDetailRouteArgs({
    this.key,
    required this.information,
  });

  final _i17.Key? key;

  final _i18.Information information;

  @override
  String toString() {
    return 'InformationDetailRouteArgs{key: $key, information: $information}';
  }
}

/// generated route for
/// [_i6.InformationScreen]
class InformationRoute extends _i16.PageRouteInfo<void> {
  const InformationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          InformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InformationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginWithOTP]
class LoginWithOTP extends _i16.PageRouteInfo<void> {
  const LoginWithOTP({List<_i16.PageRouteInfo>? children})
      : super(
          LoginWithOTP.name,
          initialChildren: children,
        );

  static const String name = 'LoginWithOTP';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LotteryResultScreen]
class LotteryResultRoute extends _i16.PageRouteInfo<void> {
  const LotteryResultRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LotteryResultRoute.name,
          initialChildren: children,
        );

  static const String name = 'LotteryResultRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NavigatorScreen]
class NavigatorRoute extends _i16.PageRouteInfo<NavigatorRouteArgs> {
  NavigatorRoute({
    _i17.Key? key,
    int pageIndex = 0,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          NavigatorRoute.name,
          args: NavigatorRouteArgs(
            key: key,
            pageIndex: pageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';

  static const _i16.PageInfo<NavigatorRouteArgs> page =
      _i16.PageInfo<NavigatorRouteArgs>(name);
}

class NavigatorRouteArgs {
  const NavigatorRouteArgs({
    this.key,
    this.pageIndex = 0,
  });

  final _i17.Key? key;

  final int pageIndex;

  @override
  String toString() {
    return 'NavigatorRouteArgs{key: $key, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i11.OTPScreen]
class OTPRoute extends _i16.PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    _i17.Key? key,
    required String phoneNumber,
    bool isLogin = false,
    List<_i16.PageRouteInfo>? children,
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

  static const _i16.PageInfo<OTPRouteArgs> page =
      _i16.PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    this.key,
    required this.phoneNumber,
    this.isLogin = false,
  });

  final _i17.Key? key;

  final String phoneNumber;

  final bool isLogin;

  @override
  String toString() {
    return 'OTPRouteArgs{key: $key, phoneNumber: $phoneNumber, isLogin: $isLogin}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ResetPasswordScreen]
class ResetPasswordRoute extends _i16.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    required String phoneNumber,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            phoneNumber: phoneNumber,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const _i16.PageInfo<ResetPasswordRouteArgs> page =
      _i16.PageInfo<ResetPasswordRouteArgs>(name);
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    required this.phoneNumber,
    this.key,
  });

  final String phoneNumber;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
