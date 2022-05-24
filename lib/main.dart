import 'package:flutter/material.dart';
import 'package:orodomop_app/presentation/presentation/note_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NotePages.routeName,
      routes: {
        NotePages.routeName: (context) => NotePages(),
      },
    );
  }
}
