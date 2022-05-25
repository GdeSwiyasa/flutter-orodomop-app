import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';

class CustomSettingsCard extends StatelessWidget {
  final Widget child;

  CustomSettingsCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.0),
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset(0, 8),
              )
            ]),
        child: child);
  }
}
