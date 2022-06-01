import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/pages/home/set_timer_pomodoro_screen.dart';

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
              Navigator.pushNamed(context, SetTimerPomodoroScreen.route);
            },
            icon: const Icon(
              Icons.timer_outlined,
              color: kPrimaryColor,
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Orodomop',
            style: kHeading5.copyWith(color: blackColor),
          ),
        ),
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: blackColor),
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
  final int _duration = 120;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: CircularCountDownTimer(
          // Countdown duration in Seconds.
          duration: _duration,

          // Countdown initial elapsed Duration in Seconds.
          initialDuration: 0,

          // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
          controller: _controller,

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
          autoStart: false,

          // This Callback will execute when the Countdown Starts.
          onStart: () {
            // Here, do whatever you want
            debugPrint('Countdown Started');
          },

          // This Callback will execute when the Countdown Ends.
          onComplete: () {
            // Here, do whatever you want
            debugPrint('Countdown Ended');
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
            title: "Start",
            onPressed: () => _controller.start(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Pause",
            onPressed: () => _controller.pause(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Resume",
            onPressed: () => _controller.resume(),
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Restart",
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
                      _controller.restart(duration: _duration);
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
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
