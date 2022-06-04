import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/pages/home/home_screen.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetTimerPomodoroScreen extends StatefulWidget {
  static const route = '/set-timer-pomodoro';
  const SetTimerPomodoroScreen({Key? key}) : super(key: key);

  @override
  State<SetTimerPomodoroScreen> createState() => _SetTimerPomodoroScreenState();
}

class _SetTimerPomodoroScreenState extends State<SetTimerPomodoroScreen> {
  TimerProvider provider = TimerProvider();

  final TextEditingController _focusTime = TextEditingController();
  final TextEditingController _breakTime = TextEditingController();
  final TextEditingController _cycle = TextEditingController();

  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<TimerProvider>(context, listen: false).loadTimer(),
    );
  }

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
      body: Consumer<TimerProvider>(
        builder: (context, provider, child) {
          _focusTime.text = provider.focusDuration.toString();
          _breakTime.text = provider.breakDuration.toString();
          _cycle.text = provider.numCycle.toString();
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Focus Time',
                                style: kSubtitle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            Container(
                              child: TextField(
                                controller: _focusTime,
                                cursorColor: blackColor,
                                keyboardType: TextInputType.number,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'second',
                                  hintStyle:
                                      kBodyText.copyWith(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: blackColor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: blackColor, width: 1),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.access_time,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Break Time',
                                style: kSubtitle.copyWith(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            Container(
                              child: TextField(
                                controller: _breakTime,
                                cursorColor: blackColor,
                                keyboardType: TextInputType.number,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'second',
                                  hintStyle:
                                      kBodyText.copyWith(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: blackColor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: blackColor, width: 1),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.access_time,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 34),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cycle',
                            style:
                                kSubtitle.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 19,
                        ),
                        Container(
                          child: TextField(
                            controller: _cycle,
                            cursorColor: blackColor,
                            keyboardType: TextInputType.number,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText:
                                  'How much do you want to iterate pomodoro',
                              hintStyle: kBodyText.copyWith(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: blackColor, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: blackColor, width: 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 237,
                          height: 40,
                          child: ElevatedButton(
                            child: Text(
                              'Save',
                              style: kSubtitle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: whiteColor,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimaryColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              // provider.breakDuration =
                              //     int.parse(_breakTime.text);
                              // provider.cycle = int.parse(_cycle.text);
                              // provider.focusDuration =
                              //     int.parse(_focusTime.text);

                              await provider.saveData(
                                  breakDuration: int.parse(_breakTime.text),
                                  focusDuration: int.parse(_focusTime.text),
                                  numCycle: int.parse(_cycle.text)
                                  // int.parse(_breakTime.text),
                                  // int.parse(_cycle.text),
                                  );
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(HomeScreen.route);
                              Phoenix.rebirth(context);

                              // showDialog<String>(
                              //   barrierDismissible: false,
                              //   context: context,
                              //   builder: (BuildContext context) => AlertDialog(
                              //     title: const Text('Discard chance'),
                              //     content: const Text('Sucess Update Data!'),
                              //     actions: <Widget>[
                              //       TextButton(
                              //         onPressed: () {
                              //           Navigator.pop(context);
                              //           Navigator.pop(context);
                              //         },
                              //         child: const Text(
                              //           'OK',
                              //           style: TextStyle(color: kPrimaryColor),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // );

                              // Provider.of<TimerProvider>(context, listen: false)
                              //     .breakDuration;
                              // Provider.of<TimerProvider>(context, listen: false)
                              //     .focusDuration;
                              // Provider.of<TimerProvider>(context, listen: false)
                              //     .cycle;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 237,
                          height: 40,
                          child: ElevatedButton(
                            child: Text(
                              'Discard',
                              style: kSubtitle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(whiteColor),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Discard chance'),
                                content: const Text(
                                    'Are you sure to Discard your chance?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: grayColor),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'OK',
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // onPressed: () =>
                            //     Navigator.pushNamed(context, HomeScreen.route),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
