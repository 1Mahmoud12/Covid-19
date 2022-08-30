import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final countryName;
   Country({Key? key,required this.countryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
