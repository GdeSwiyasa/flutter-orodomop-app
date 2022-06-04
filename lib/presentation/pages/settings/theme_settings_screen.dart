import 'package:flutter/material.dart';
import 'package:orodomop_app/presentation/widgets/custom_app_bar.dart';
import 'package:orodomop_app/presentation/widgets/custom_text_button.dart';
import 'package:orodomop_app/presentation/widgets/settings_card_item.dart';

class ThemeSettingScreen extends StatelessWidget {
  static const route = '/theme';
  const ThemeSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBar: AppBar(),
        title: 'Theme',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomSettingsCard(
                child: CustomTextButton(
                    isSwiched: true,
                    title: 'Change theme',
                    subTitle: 'Change theme for this app',
                    onTap: () {}))
          ],
        ),
      ),
    );
  }
}
