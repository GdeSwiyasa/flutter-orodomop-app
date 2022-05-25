import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const route = '/settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Settings Screen"),
      ),
    );
  }
}
