import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../utils/router.gr.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  final authManager = GetIt.I<AuthManager>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nome e sobrenome',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'E-mail',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Senha',
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 12)),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () async {
            await authManager.signUp(
              nameController.text.trim(),
              emailController.text.trim(),
              passwordController.text,
            );
            if (context.mounted && authManager.isAuthenticated) {
              context.replaceRoute(HomeRoute());
            }
          },
          child: const Text('CADASTRAR-SE'),
        ),
      ],
    );
  }
}
