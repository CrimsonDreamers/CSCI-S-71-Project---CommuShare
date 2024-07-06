import 'package:commushare_front/service/database.dart';
import 'package:commushare_front/views/login.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreenWrapper extends StatelessWidget {
  final DatabaseService databaseService;

  const SplashScreenWrapper({super.key, required this.databaseService});

  //final cookie = document.cookie;

  @override
  Widget build(BuildContext context) {
    if (false) {
      return const Login();
    } else {
      return Home(
        databaseService: databaseService,
      );
    }
  }
}
