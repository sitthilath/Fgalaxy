import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/forgot_password_notifier_provider.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/state/forgot_password_state.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/provider/validate_provider.dart';
import 'package:galaxy_18_lottery_app/features/forgot-password/presentation/widgets/phone_field.dart';
import 'package:galaxy_18_lottery_app/infrastructure/messages/providers/flutter_toast_message_provider.dart';
import 'package:galaxy_18_lottery_app/routes/app_route.gr.dart';
import 'package:galaxy_18_lottery_app/services/loader_service/providers/loader_provider.dart';
import 'package:galaxy_18_lottery_app/shared/globals.dart';
import 'package:galaxy_18_lottery_app/shared/style/text_style.dart';
import 'package:galaxy_18_lottery_app/shared/utils/app_color.dart';
import 'package:galaxy_18_lottery_app/shared/utils/localization_text.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/appbars/shared_appbar.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/help_widget.dart';
import 'package:galaxy_18_lottery_app/shared/widgets/label_widget.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  static const String routeName = '/forgotPasswordScreen';

  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? phoneIsEmpty = ref.watch(checkPhoneNumberProvider);
    ref.read(loaderProvider).context = context;
    ref.watch(forgotPasswordStateNotifierProvider);
    _listenForgotState(ref);
    return Scaffold(
      appBar: SharedAppbar(
          title: Txt.t(context, 'forgot_password_title'),
          color: AppColor.primaryColor),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            labelText(
                color: AppColor.blackColor,
                text: Txt.t(context, 'phone_number'),
                fontWeight: FontWeight.w400),
            heightBox(10),
            PhoneField(
              controller: _phoneController,
              onChange: (value) {
                ref.read(checkPhoneNumberIsEmptyProvider.notifier).state =
                    value;
              },
              errorMsg:
                  phoneIsEmpty != null ? Txt.t(context, phoneIsEmpty) : null,
            )
          ],
        ),
      ),
      bottomSheet: _nextButton(),
    );
  }

  _nextButton() {
    return InkWell(
      onTap: () => _onValidate(),
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(Txt.t(context, "next"),
            style: styleWhite(size: 14, weight: FontWeight.w400)),
      ),
    );
  }

  _onValidate() async {
    focusDisable(context);
    ref.read(checkPhoneNumberIsEmptyProvider.notifier).state =
        _phoneController.text;
    if (_phoneController.text.isNotEmpty && _phoneController.text.length == 10) {
      await ref
          .read(forgotPasswordStateNotifierProvider.notifier)
          .forgotPassword(_phoneController.text);
    }
  }

  void _listenForgotState(WidgetRef ref) {
    ref.listen(forgotPasswordStateNotifierProvider.select((value) => value),
        (previous, next) async {
      if (next is Loading) {
        await ref
            .read(loaderProvider)
            .showLoader(Txt.t(context, 'waiting_msg'));
      } else if (next is HasPhone) {
        ref.read(loaderProvider).closeLoader();
        AutoRouter.of(context)
            .push(ResetPasswordRoute(phoneNumber: _phoneController.text));
      } else if (next is NotFoundPhone) {
        ref.read(loaderProvider).closeLoader();
        await ref.read(toastMessageProvider).messageError(
            message:
                '${Txt.t(context, 'phone_number')} ${LA_PREFIX + _phoneController.text} ${Txt.t(context, 'this_phone_not_have_in_system')}');
      } else if (next is Failure) {
        ref.read(loaderProvider).closeLoader();
        ref
            .read(toastMessageProvider)
            .messageError(message: next.exception.message.toString());
      }
    });
  }
}
