import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../utils/assets.dart';
import '../../utils/router.gr.dart';
import 'sign_in_view_model.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  final viewModel = GetIt.I<SignInViewModel>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          ImageAssets.signInBackground,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: () => context.pushRoute(SignUpRoute()),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text('CRIAR CONTA'),
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 72),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageAssets.storeLogo,
                    width: 156,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 24)),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      hintText: 'E-mail',
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  Observer(
                    builder: (context) => TextFormField(
                      controller: passwordController,
                      obscureText: !viewModel.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        hintText: 'Senha',
                        suffixIcon: IconButton(
                          onPressed: viewModel.togglePasswordVisible,
                          isSelected: viewModel.isPasswordVisible,
                          icon: const Icon(Icons.visibility_outlined),
                          selectedIcon:
                              const Icon(Icons.visibility_off_outlined),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 4)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => throw UnimplementedError(),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('esqueci a senha'),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 24)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await GetIt.I<AuthManager>().signIn(
                            emailController.text.trim(),
                            passwordController.text,
                          );
                          if (context.mounted) {
                            context.replaceRoute(HomeRoute());
                          }
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(148, 48),
                          backgroundColor: Colors.white,
                        ),
                        child: const Text('ENTRAR'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
