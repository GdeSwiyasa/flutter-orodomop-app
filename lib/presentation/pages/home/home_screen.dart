import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/pages/home/set_timer_pomodoro_screen.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(SetTimerPomodoroScreen.route);
            },
            icon: Icon(
              Icons.timer_outlined,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Orodomop',
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: PomodoroTimer(
        title: "Home Screen",
      ),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  PomodoroTimer({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<PomodoroTimer> createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int cycleFront = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<TimerProvider>(context, listen: false).loadTimer(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, provider, child) {
        // cycleFront = provider.cycle * 2;
        // int duration = provider.focusDuration;
        return Scaffold(
          body: Align(
            alignment: Alignment.topCenter,
            child: CircularCountDownTimer(
              // Countdown duration in Seconds.
              duration: provider.focusStatus
                  ? provider.focusDurationToMinute
                  : provider.breakDurationToMinute,

              // Countdown initial elapsed Duration in Seconds.
              initialDuration: 0,

              // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
              controller: provider.controller,

              // Width of the Countdown Widget.
              width: MediaQuery.of(context).size.width / 1.5,

              // Height of the Countdown Widget.
              height: MediaQuery.of(context).size.height / 1.5,

              // Ring Color for Countdown Widget.
              ringColor: grayColor,

              // Ring Gradient for Countdown Widget.
              ringGradient: null,

              // Filling Color for Countdown Widget.
              fillColor: kPrimaryColor,

              // Filling Gradient for Countdown Widget.
              fillGradient: null,

              // Background Color for Countdown Widget.
              backgroundColor: whiteColor,

              // Background Gradient for Countdown Widget.
              backgroundGradient: null,

              // Border Thickness of the Countdown Ring.
              strokeWidth: 17.0,

              // Begin and end contours with a flat edge and no extension.
              strokeCap: StrokeCap.round,

              // Text Style for Countdown Text.
              textStyle: const TextStyle(
                fontSize: 53.0,
                color: blackColor,
                fontWeight: FontWeight.bold,
              ),

              // Format for the Countdown Text.
              textFormat: CountdownTextFormat.MM_SS,

              // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
              isReverse: true,

              // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
              isReverseAnimation: true,

              // Handles visibility of the Countdown Text.
              isTimerTextShown: true,

              // Handles the timer start.
              autoStart: true,

              // This Callback will execute when the Countdown Starts.
              onStart: () {
                // Here, do whatever you want11

                print(provider.cycle);
                provider.cycle--;
              },

              // This Callback will execute when the Countdown Ends.
              onComplete: () {
                print(provider.focusDuration);
                // Here, do whatever you want
                if (provider.cycle > 0) {
                  if (provider.focusStatus) {
                    provider.focusStatus = false;
                    provider.restartTimer(provider.focusDurationToMinute);
                  } else {
                    provider.focusStatus = true;
                    provider.restartTimer(provider.breakDurationToMinute);
                  }
                }
              },
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 30,
              ),
              _button(
                  icon: Icons.play_arrow_rounded,
                  onPressed: () {
                    provider.startTimerFocus();
                    if (provider.cycle < 0) {
                      Phoenix.rebirth(context);
                      provider.startTimerFocus();
                    }
                  }),
              const SizedBox(
                width: 10,
              ),
              _button(
                icon: Icons.pause,
                onPressed: () => provider.pauseTimer(),
              ),
              const SizedBox(
                width: 10,
              ),
              _button(
                icon: Icons.navigate_next_rounded,
                onPressed: () => provider.resumeTimer(),
              ),
              const SizedBox(
                width: 10,
              ),
              _button(
                icon: Icons.restart_alt,
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Restart Timer'),
                    content: const Text('Are you sure to restart the timer?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: grayColor),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                          // provider.restartTimer(provider.focusDuration);
                          provider.startTimerFocus();
                          Phoenix.rebirth(context);
                        },
                        child: const Text(
                          'OK',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                ), // _controller.restart(duration: _duration),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _button({required IconData icon, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        child: Icon(
          icon,
          size: 25.0,
          color: whiteColor,
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
