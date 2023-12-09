import 'package:flutter/material.dart';
import 'package:movement_app/const/const.dart';

class MainScreen extends StatelessWidget {
  final int number;

  const MainScreen({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/img/dice (${number}).png'),
        ),
        SizedBox(
          height: 32.0,
        ),
        Text(
          "Lucky Number",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20.2,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          number.toString(),
          style: TextStyle(
            color: primaryColor,
            fontSize: 60.0,
            fontWeight: FontWeight.w200,
          ),
        )
      ],
    );
  }
}
