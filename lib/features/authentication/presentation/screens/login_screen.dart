import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galaxy_18_lottery_app/features/authentication/presentation/providers/auth_providers.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  static const routeName = '/loginScreen';
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController =
      TextEditingController(text: 'kminchelle');
  final TextEditingController passwordController =
      TextEditingController(text: '0lelplR');

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
                controller: usernameController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'username',
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
                controller: passwordController,
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
              loading: (_) => const Center(child: CircularProgressIndicator()),
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
        ref.watch(authStateNotifierProvider.notifier).loginUser(usernameController.text, passwordController.text);
      },
      child: const Text('Login'),
    );
  }
}
