import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/cubit/timer_pomodoro_cubit.dart';
import 'package:orodomop_app/presentation/widgets/pop_up_modal.dart';
import 'package:orodomop_app/presentation/widgets/timer_pomodoro_slider.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/home_timer-pomodoro-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final timerPomodoroCubit = context.read<TimerPomodoroCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: SafeArea(
          child: TimerBody(),
        ),
      ),
    );
  }
}

class TimerBody extends StatelessWidget {
  const TimerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TimerPomodoro(),
        _TimerActionButton(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.timer_sharp),
                iconSize: 30,
                color: kPrimaryColor,
              )
              // TextButton(
              //   onPressed: () {
              //     //   Navigator.pushNamed(context, PomodoroTimerSettingsPage.ROUTE_NAME);
              //   },
              //   child: Text(
              //     'Set Up Timmer',
              //     style: TextStyle(color: kPrimaryColor),
              //   ),
              // ),
              ),
        ),
      ],
    );
  }
}

class TimerPomodoro extends StatelessWidget {
  const TimerPomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TimerSlider(),
        CountTimer(),
      ],
    );
  }
}

class TimerSlider extends StatelessWidget {
  const TimerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TimerPomodoroCubit>();
    final state = cubit.state;
    final color;
    if (state.mode.isWork) {
      color = kPrimaryColor;
    } else {
      color = greenColor;
    }
    final value = state.currentDuration / state.duration;

    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: PomodoroTimerSlider(
              color: color,
              value: 1 - value,
            ),
          ),
        ],
      ),
    );
  }
}

class CountTimer extends StatelessWidget {
  const CountTimer({Key? key}) : super(key: key);

  String _numberFormat(int value) {
    return value.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TimerPomodoroCubit>();
    final state = cubit.state;

    final minutes = _numberFormat(state.currentDuration ~/ 60);
    final seconds = _numberFormat(state.currentDuration % 60);

    return Center(
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 90,
          color: blackColor,
        ),
        child: Text(
          '$minutes:$seconds',
        ),
      ),
    );
  }
}

class _TimerActionButton extends StatelessWidget {
  const _TimerActionButton({Key? key}) : super(key: key);

  void _openTimerStopModal(BuildContext context) async {
    final cubit = context.read<TimerPomodoroCubit>();

    cubit.pause();

    await showPopupModal(
      context: context,
      title: 'Are you sure you want to stop timer budhi?',
      onCancel: cubit.resume,
      onConiform: cubit.stop,
    );
  }

  Widget _buildStartButton(BuildContext context) {
    final cubit = context.read<TimerPomodoroCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FloatingActionButton(
        onPressed: () {
          cubit.start();
        },
        child: Icon(Icons.play_arrow_rounded),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    final cubit = context.read<TimerPomodoroCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: FloatingActionButton(
              onPressed: () => _openTimerStopModal(context),
              child: Icon(Icons.stop),
              backgroundColor: kPrimaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: FloatingActionButton(
              onPressed: () => cubit.pause(),
              child: Icon(Icons.pause),
              backgroundColor: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkipBreakButton(BuildContext context) {
    final cubit = context.read<TimerPomodoroCubit>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FloatingActionButton(
        onPressed: () => cubit.nextCycle(),
        child: Icon(Icons.skip_next_rounded),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget _buildResumeButton(BuildContext context) {
    final cubit = context.read<TimerPomodoroCubit>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FloatingActionButton(
        onPressed: () => cubit.resume(),
        child: Icon(Icons.navigate_next_rounded),
        backgroundColor: kPrimaryColor,
      ),
    );
  }

  Widget _buildCrossFade(
      Widget firstChild, Widget secondChild, bool showFristChild) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState:
          showFristChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TimerPomodoroCubit>();
    final state = cubit.state;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: _buildCrossFade(
          _buildStartButton(context),
          _buildCrossFade(
            _buildCrossFade(
              _buildToggleButton(context),
              _buildSkipBreakButton(context),
              state.mode.isWork,
            ),
            _buildResumeButton(context),
            state.status.isPaused == false,
          ),
          state.status.isStopped,
        ),
      ),
    );
  }
}
