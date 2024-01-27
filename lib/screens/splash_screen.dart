import 'dart:async';

import 'package:amazon/provider/sign_in_provider.dart';
import 'package:amazon/screens/home_screen.dart';
import 'package:amazon/screens/login_screen.dart';
import 'package:amazon/utilss/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();

    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreenReplace(context, const LogInScreen())
          : nextScreenReplace(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Image(
            // image: AssetImage("MyAssets/splashimage.png"),
            image: NetworkImage(
                "https://miro.medium.com/v2/resize:fit:500/1*Q7TzUZZ9bOZO7rQsbc6IGg.png"),
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
