import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/provider/news_list_notifier.dart';
import 'package:orodomop_app/presentation/provider/search_news_list_notifier.dart';
import 'package:orodomop_app/presentation/widgets/news_card.dart';
import 'package:provider/provider.dart';

import '../../../../common/state_enum.dart';

class NewsSearchPage extends StatefulWidget {
  static const route = '/News_page/search';
  const NewsSearchPage({Key? key}) : super(key: key);

  @override
  State<NewsSearchPage> createState() => _NewsSearchPageState();
}

class _NewsSearchPageState extends State<NewsSearchPage> {
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
            'News Search',
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                if (query == '') {
                  query = 'a';
                }
                Future.microtask(() =>
                    Provider.of<SearchNewsListNotifier>(context, listen: false)
                      ..fetchSearchNews(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            Consumer<SearchNewsListNotifier>(builder: (context, data, child) {
              final state = data.state;
              if (state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.newsList.length,
                    itemBuilder: (context, index) {
                      var news = data.newsList[index];
                      return NewsCard(
                        news: news,
                      );
                    },
                  ),
                );
              } else if (state == RequestState.Error) {
                return Center(child: Text(data.message));
              } else {
                return const Center(child: Text('Empty'));
              }
            }),
          ],
        ),
      ),
    );
  }
}




// Consumer<NewsListNotifier>(builder: (context, data, child) {
//         final state = data.state;
//         if (state == RequestState.Loading) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state == RequestState.Loaded) {
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: data.newsList.length,
//             itemBuilder: (context, index) {
//               var news = data.newsList[index];
//               return NewsCard(
//                 news: news,
//               );
//             },
//           );
//         } else {
//           return const Text('Failed');
//         }
//       }),