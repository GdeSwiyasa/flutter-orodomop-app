import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';

class SetTimerPomodoro extends StatelessWidget {
  static const route = '/set-timer-pomodoro';
  const SetTimerPomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Set Timer',
            style: kHeading5.copyWith(color: blackColor),
          ),
        ),
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Center(
        child: Text("News Screen"),
      ),
    );
  }
}
