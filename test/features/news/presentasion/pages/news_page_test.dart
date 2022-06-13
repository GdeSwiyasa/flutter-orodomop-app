import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/presentation/pages/news/news_page.dart';
import 'package:orodomop_app/presentation/provider/news_list_notifier.dart';
import 'package:provider/provider.dart';

import 'news_page_test.mocks.dart';

@GenerateMocks([NewsListNotifier])
void main() {
  late MockNewsListNotifier mockNewsListNotifier;

  setUp(() {
    mockNewsListNotifier = MockNewsListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<NewsListNotifier>.value(
      value: mockNewsListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Should display center progress bar when loading",
    (WidgetTester tester) async {
      when(mockNewsListNotifier.state).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsPage()));

      expect(centerFinder, findsWidgets);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(mockNewsListNotifier.state).thenReturn(RequestState.Loaded);
      when(mockNewsListNotifier.newsList).thenReturn(<News>[]);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(NewsPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display Error message when data is error",
    (WidgetTester tester) async {
      when(mockNewsListNotifier.state).thenReturn(RequestState.Error);
      when(mockNewsListNotifier.message).thenReturn("Error Message");

      final textfinder = find.text("Error Message");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsPage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Should display Empty message when when no data found",
    (WidgetTester tester) async {
      when(mockNewsListNotifier.state).thenReturn(RequestState.Empty);

      final textfinder = find.text("Empty");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsPage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );
}
