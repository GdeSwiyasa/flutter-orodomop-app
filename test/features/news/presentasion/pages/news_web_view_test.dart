import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/presentation/pages/news/news_web_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets(
    "Should display center progress bar when opening web view",
    (WidgetTester tester) async {
      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(const NewsWebViewPage(
        url: 'https://www.nytimes.com/live/2022/06/12/theater/tony-awards',
      )));

      expect(centerFinder, findsWidgets);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display center progress bar when opening web view",
    (WidgetTester tester) async {
      final webViewFinder = find.byType(WebView);

      await Future.delayed(
          const Duration(seconds: 10),
          () => tester.pumpWidget(_makeTestableWidget(const NewsWebViewPage(
                url:
                    'https://www.nytimes.com/live/2022/06/12/theater/tony-awards',
              ))));

      expect(webViewFinder, findsWidgets);
    },
  );
}
