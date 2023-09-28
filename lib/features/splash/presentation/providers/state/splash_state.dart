import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';
@freezed
abstract class SplashAppState with _$SplashAppState{
  const factory SplashAppState.initial() = Initial;
  const factory SplashAppState.loading() = Loading;
  const factory SplashAppState.invalidToken() = InvalidToken;
  const factory SplashAppState.noInternet() = NoInternet;
  const factory SplashAppState.accepted() = Accepted;
}