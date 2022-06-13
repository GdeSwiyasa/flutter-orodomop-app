import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/constant.dart';

class NewsWebViewPage extends StatefulWidget {
  static const route = '/News_page/detail/webView';

  final String url;
  const NewsWebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<NewsWebViewPage> createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends State<NewsWebViewPage> {
  bool isLoading=true;

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
            'News Web View',
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onPageFinished: (finish){
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? const Center( child: CircularProgressIndicator(),)
                    : Stack(), 
        ]
      ),
    );
  }
}
