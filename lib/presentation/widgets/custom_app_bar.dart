import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/common/dark_theme.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const buildAppBar({Key? key, required this.appBar, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title.toString(),
          style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      // iconTheme: IconThemeData(color: blackColor),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
