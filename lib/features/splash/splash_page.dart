import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/init_state_mixin.dart';
import '../../utils/router.dart';
import '../../utils/router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget with InitStateMixin {
  SplashPage({super.key});

  @override
  void initState() async {
    router.replace(HomeRoute());
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
