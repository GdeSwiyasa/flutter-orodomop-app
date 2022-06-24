import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/presentation/provider/quote_list_notifier.dart';
import 'package:orodomop_app/presentation/widgets/quote_card.dart';
import 'package:provider/provider.dart';

import '../../../../common/state_enum.dart';

class QuotePage extends StatefulWidget {
  static const route = '/Quote_page';
  const QuotePage({Key? key}) : super(key: key);

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() =>
        Provider.of<QuoteListNotifier>(context, listen: false)
          ..fetchGetQuote());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Quotes",
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Consumer<QuoteListNotifier>(builder: (context, data, child) {
        final state = data.state;
        if (state == RequestState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == RequestState.Loaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.quoteList.length,
            itemBuilder: (context, index) {
              var quote = data.quoteList[index];
              return QuoteCard(
                quote: quote,
              );
            },
          );
        } else if (state == RequestState.Error) {
          return Center(child: Text(data.message));
        } else {
          return const Center(child: Text("Empty"));
        }
      }),
    );
  }
}
