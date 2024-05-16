import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/auth_manager.dart';
import '../../utils/assets.dart';
import '../../utils/cron.dart';
import '../../utils/init_state_mixin.dart';
import '../../utils/router.dart';
import '../../utils/router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget with InitStateMixin {
  final authManager = GetIt.I<AuthManager>();

  SplashPage({super.key});

  @override
  void initState() async {
    await Future.delayed(1.seconds);
    final route = authManager.isAuthenticated ? HomeRoute() : SignInRoute();
    router.replace(route as PageRouteInfo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 24,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Image.asset(
              ImageAssets.storeLogo,
              height: 150,
            ),
            const SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
