import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
