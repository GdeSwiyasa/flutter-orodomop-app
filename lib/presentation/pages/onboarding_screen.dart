import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/main.dart';
import 'package:orodomop_app/presentation/pages/main_view.dart';
import 'package:orodomop_app/presentation/widgets/animated_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  static const route = '/';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = new PageController(initialPage: 0);

  Future setshowHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showHome = await prefs.setBool('showHome', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setshowHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
              Slide(
                  hero: Image.asset("assets/on_boarding1.png"),
                  title: "Helping Time Management",
                  subtitle:
                      "Make a schedule of activities with an estimated time needed to achieve the desired results with the appropriate time",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("assets/on_boarding2.png"),
                  title: "Avoiding Stacked Tasks",
                  subtitle:
                      "Doing work on a scheduled basis with a focus on using the pomodoro technique",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("assets/on_boarding3.png"),
                  title: "Complete all tasks according to the deadline",
                  subtitle:
                      "Work can be completed in accordance with the deadline for processing and submitted on time",
                  onNext: nextPage),
              Scaffold(
                body: MainView(),
              )
            ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide(
      {required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: hero),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  subtitle,
                  style: kBodyText.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: Container(
              height: 60,
              width: 60,
              child: Center(
                  child: IconButton(
                      onPressed: onNext, icon: Icon(Icons.arrow_right))),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99),
                  color: kPrimaryColor),
            ),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}
