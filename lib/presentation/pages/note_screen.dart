import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  static const route = '/note_screen';
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Note Screen"),
      ),
    );
  }
}
