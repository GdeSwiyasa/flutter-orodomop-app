import 'package:flutter/material.dart';

import '../../../common/constant.dart';

class EditNotePage extends StatelessWidget {
  static const route = '/edit_note_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(
          size: 20,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.delete_outline_rounded),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.done),
          )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Your Note',
            style: kHeading5.copyWith(color: blackColor),
          ),
        ),
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: blackColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Subject'),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Add subject',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: blackColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: blackColor, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text('To-do'),
              const SizedBox(height: 32),
              TextField(
                cursorColor: blackColor,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Add what you supossed to do',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: blackColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: blackColor, width: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
