import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final String subTitle;
  var onTap = () {};
  final bool isSwiched;

  CustomTextButton({
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.isSwiched = false,
  });

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      kSubtitle.copyWith(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  subTitle,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: kBodyText.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
            isSwiched == true
                ? Switch(
                    value: themeChange.darkTheme,
                    onChanged: (value) {
                      themeChange.darkTheme = value;
                    })
                : Container()
          ],
        ),
      ),
    );
  }
}
