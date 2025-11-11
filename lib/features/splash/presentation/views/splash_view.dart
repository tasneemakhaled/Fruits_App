import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants.dart';
import 'package:fruit_app/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 6), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return OnboardingView();
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50),
          Image.asset('assets/images/text.png'),
          Image.asset('assets/images/fruit.png'),
        ],
      ),
    );
  }
}
