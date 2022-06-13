import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:orodomop_app/presentation/pages/news/news_detail_page.dart';

import '../../../../dummy_data/dummy_data.dart';

void main() {
  Widget _makeTestableWidget(Widget body) {
    return MaterialApp(
      home: body,
    );
  }

  testWidgets(
    "Should display network image of news",
    (WidgetTester tester) async {
      final networkImageFinder = find.byType(Hero);

      await mockNetworkImagesFor(() => tester
          .pumpWidget(_makeTestableWidget(NewsDetailPage(news: testNews))));

      expect(networkImageFinder, findsOneWidget);
    },
  );

  testWidgets(
    "test description",
    (WidgetTester tester) async {
      final descriptionFinder = find.byKey(Key("description"));
      final titleFinder = find.byKey(Key("title"));
      final authorFinder = find.byKey(Key("author"));
      final dateFinder = find.byKey(Key("date"));
      final contentFinder = find.byKey(Key("content"));

      await mockNetworkImagesFor(() => tester
          .pumpWidget(_makeTestableWidget(NewsDetailPage(news: testNews))));

      expect(descriptionFinder, findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(authorFinder, findsOneWidget);
      expect(dateFinder, findsOneWidget);
      expect(contentFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display button 'Read More'",
    (WidgetTester tester) async {
      final buttonfinder = find.byType(ElevatedButton);

      await mockNetworkImagesFor(() => tester
          .pumpWidget(_makeTestableWidget(NewsDetailPage(news: testNews))));

      expect(buttonfinder, findsOneWidget);
    },
  );
}
