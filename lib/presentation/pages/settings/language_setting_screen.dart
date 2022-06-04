import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:orodomop_app/presentation/widgets/custom_app_bar.dart';
import 'package:orodomop_app/presentation/widgets/custom_text_button.dart';
import 'package:orodomop_app/presentation/widgets/settings_card_item.dart';
import 'package:provider/provider.dart';

class LanguageSettingScreen extends StatefulWidget {
  static const route = '/language';

  @override
  State<LanguageSettingScreen> createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBar: AppBar(),
        title: 'Language',
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            CustomSettingsCard(
              child: CustomTextButton(
                title: 'Select language',
                subTitle: 'Select language do you need',
                onTap: () {
                  _languageDialog();
                },
              ),
            )
            // ElevatedButton(onPressed: _languageDialog(), child: Text(''))
          ],
        ),
      ),
    );
  }

  Future<void> _languageDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Select Language'),
            children: [
              SimpleDialogOption(
                onPressed: () async {
                  context.setLocale(Locale('id'));
                  Navigator.pop(context);
                },
                child: Text('Indonesia'),
              ),
              SimpleDialogOption(
                onPressed: () async {
                  context.setLocale(Locale('en'));
                  Navigator.pop(context);
                },
                child: Text('English'),
              ),
            ],
          );
        });
  }
}
