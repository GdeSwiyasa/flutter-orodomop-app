import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';

class NotePages extends StatelessWidget {
  static const routeName = 'note_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Note'),
          backgroundColor: whiteColor,
          foregroundColor: blackColor,
          elevation: 0,
        ),
        body: Container(),
      ),
    );
  }
}
