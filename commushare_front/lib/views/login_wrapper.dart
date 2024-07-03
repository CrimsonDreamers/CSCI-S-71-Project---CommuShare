import 'package:commushare_front/views/login.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({super.key});
  //final cookie = document.cookie;

  @override
  Widget build(BuildContext context) {
    if (true) {
      return const Login();
    } else {
      return const Home();
    }
  }
}
