import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;

  const buildAppBar({Key? key, required this.appBar, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title.toString(),
          style: kHeading5.copyWith(color: blackColor),
        ),
      ),
      backgroundColor: whiteColor,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
