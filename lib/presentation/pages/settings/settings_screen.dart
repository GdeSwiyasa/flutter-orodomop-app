import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/common/locale/locale_keys.g.dart';
import 'package:orodomop_app/presentation/pages/settings/language_setting_screen.dart';
import 'package:orodomop_app/presentation/pages/settings/theme_settings_screen.dart';
import 'package:orodomop_app/presentation/widgets/custom_app_bar.dart';
import 'package:orodomop_app/presentation/widgets/custom_text_button.dart';
import 'package:orodomop_app/presentation/widgets/settings_card_item.dart';
import 'package:provider/provider.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
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
                _generalSettingsItem(context),
              ],
            )),
      ),
    );
  }

  Widget _generalSettingsItem(BuildContext context) {
    return CustomSettingsCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.general.tr(),
              style: kTitle.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextButton(
                isSwiched: false,
                title: LocaleKeys.language.tr(),
                subTitle: LocaleKeys.language_args.tr(),
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(LanguageSettingScreen.route);
                }),
            Container(
              color: blackColor.withOpacity(0.1),
              height: 1.0,
            ),
            CustomTextButton(
                isSwiched: false,
                title: LocaleKeys.theme.tr(),
                subTitle: LocaleKeys.theme_args.tr(),
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(ThemeSettingScreen.route);
                }),
            Container(
              color: blackColor.withOpacity(0.1),
              height: 1.0,
            ),
            CustomTextButton(
                isSwiched: false,
                title: LocaleKeys.notification.tr(),
                subTitle: LocaleKeys.notifications_args.tr(),
                onTap: () {}),
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
