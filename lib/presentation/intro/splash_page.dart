import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(
        RouteConstants.root,
        pathParameters: PathParameters().toMap(),
      ),
    );
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Image.asset('assets/images/splashscreen.png'),
          )),
    );
  }
}
