import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orodomop_app/common/locale/locale_keys.g.dart';
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
        title: LocaleKeys.theme.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomSettingsCard(
                child: CustomTextButton(
                    isSwiched: true,
                    title: LocaleKeys.change_theme.tr(),
                    subTitle: LocaleKeys.change_theme_args.tr(),
                    onTap: () {}))
          ],
        ),
      ),
    );
  }
}
