import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/provider/news_list_notifier.dart';
import 'package:orodomop_app/presentation/widgets/news_card.dart';
import 'package:provider/provider.dart';

import '../../../../common/state_enum.dart';

class NewsPage extends StatefulWidget {
  static const route = '/News_page';
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NewsListNotifier>(context, listen: false)..fetchGetNews());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'News',
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Consumer<NewsListNotifier>(builder: (context, data, child) {
        final state = data.state;
        if (state == RequestState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.Loaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.newsList.length,
            itemBuilder: (context, index) {
              var news = data.newsList[index];
              return NewsCard(
                news: news,
              );
            },
          );
        } else {
          return const Text('Failed');
        }
      }),
    );
  }
}
