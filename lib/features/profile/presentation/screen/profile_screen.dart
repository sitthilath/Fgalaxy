import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/simple_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/modals/confirm_modal.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/theme_widget.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  static const String routeName = "/profileScreen";

  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ProfileState();
}

class ProfileState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(authStateNotifierProvider);
    ref.read(toastMessageProvider).initialMessage(context);
    ref.read(loaderProvider).context = context;
    _listenAuthState();
    return ThemeApp(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: SimpleAppbar(title: Txt.t(context, 'profile')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(child: Container()),
              InkWell(
                onTap: () async {
                  final confirmResult = await showLogoutConfirmModal(context,
                      title: 'logout_title', content: 'logout_content');
                  if (confirmResult == 'ok') {
                    ref.read(authStateNotifierProvider.notifier).logoutUser();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.whiteColor,
                  ),
                  child: Text(Txt.t(context, 'logout'),
                      style: stylePrimary(size: 14, weight: FontWeight.w400)),
                ),
              ),
              heightBox(15),
            ],
          ),
        ),
      ),
    );
  }

  void _listenAuthState() {
    ref.listen(authStateNotifierProvider.select((value) => value),
        (previous, next) {
      switch(next.state) {
        case AuthConcreteState.signingOut:
          ref.read(loaderProvider).showLoader(Txt.t(context, 'waiting_msg'));
          break;
        case AuthConcreteState.signedOut:
          ref.read(loaderProvider).closeLoader();
          ref
              .read(toastMessageProvider)
              .messageSuccess(message: Txt.t(context, 'logout_success_msg'));
          AutoRouter.of(context)
              .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
          break;
        case AuthConcreteState.failure:
          ref.read(loaderProvider).closeLoader();
          ref.read(toastMessageProvider).messageError(message: next.message);
          break;
        default:
          break;
      }
    });
  }
}
