import 'dart:async';

import 'package:covid_19/modules/home_layout.dart';
import 'package:covid_19/shared/components/components.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
   SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? t;
  @override
  Widget build(BuildContext context) {

     t=Timer(const Duration(seconds: 1), () {
      print(5);
      navigateAndEnd(context, HomeLayout());
    });

    return Scaffold(
      primary: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/covid-19.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    t!.cancel();
  }
}
