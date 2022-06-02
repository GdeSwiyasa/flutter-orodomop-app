import 'package:flutter/material.dart';
import 'package:orodomop_app/presentation/widgets/custom_app_bar.dart';

class NewsScreen extends StatelessWidget {
  static const route = '/news_screen';
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        appBar: AppBar(),
        title: 'News',
      ),
      body: Center(
        child: Text("News Screen"),
      ),
    );
  }
}
