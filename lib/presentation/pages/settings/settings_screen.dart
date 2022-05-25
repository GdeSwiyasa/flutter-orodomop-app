import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/pages/settings/widget/settings_card_item.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Settings",
            style: kHeading5.copyWith(color: blackColor),
          ),
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CustomSettingsCard(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Column(
                children: [
                  _textBuildButton(
                    'Language',
                    'adjust the language according to your needs',
                  ),
                  Container(
                    color: blackColor.withOpacity(0.1),
                    height: 1.0,
                  ),
                  _textBuildButton(
                      'Theme', 'adjust the theme according to your needs'),
                  Container(
                    color: blackColor.withOpacity(0.1),
                    height: 1.0,
                  ),
                  _textBuildButton('Notifications',
                      'adjust the notifications according to your needs'),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextButton _textBuildButton(String title, String subTitle) {
    return TextButton(
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kSubtitle.copyWith(color: blackColor),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            subTitle,
            style: kBodyText.copyWith(color: blackColor),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(),
        ],
      ),
    );
  }
}
