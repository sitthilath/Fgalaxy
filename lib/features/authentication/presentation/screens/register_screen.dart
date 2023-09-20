import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';
import 'package:galaxy_18_lottery_app/shared/domain/models/user/user_form.dart';

@RoutePage()
class RegisterScreen extends ConsumerWidget{
  RegisterScreen({super.key});

  final TextEditingController txtPhoneNumber = TextEditingController(text: '2076782728');
  final TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galaxy18 Lottery'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: TextField(
                controller: txtPhoneNumber,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: TextField(
                controller: txtPassword,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
            state.maybeMap(
              signing: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => loginButton(ref),
            )
          ],
        ),
      ),
    );
  }
  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref.watch(authStateNotifierProvider.notifier).verifyPhoneNumber(UserForm(phoneNumber: txtPhoneNumber.text, password: txtPassword.text));
      },
      child: const Text('Verify'),
    );
  }
}