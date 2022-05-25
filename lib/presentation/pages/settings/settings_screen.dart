import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/widgets/app_bar.dart';
import 'package:orodomop_app/presentation/widgets/settings_card_item.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBar: AppBar(),
        title: 'Settings',
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                _generalSettingsItem(),
              ],
            )),
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

  Widget _generalSettingsItem() {
    return CustomSettingsCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: kTitle.copyWith(
                  color: blackColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
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
    );
  }
}
