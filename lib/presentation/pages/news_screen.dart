import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  static const route = '/news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("News Screen"),
      ),
    );
  }
}
