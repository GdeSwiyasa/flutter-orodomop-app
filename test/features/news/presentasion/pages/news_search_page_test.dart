import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/presentation/pages/news/news_search_page.dart';
import 'package:orodomop_app/presentation/provider/search_news_list_notifier.dart';
import 'package:provider/provider.dart';

import 'news_search_page_test.mocks.dart';

@GenerateMocks([SearchNewsListNotifier])
void main() {
  late MockSearchNewsListNotifier mockSearchNewsListNotifier;

  setUp(() {
    mockSearchNewsListNotifier = MockSearchNewsListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<SearchNewsListNotifier>.value(
      value: mockSearchNewsListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Should display center progress bar when loading",
    (WidgetTester tester) async {
      when(mockSearchNewsListNotifier.state).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsSearchPage()));

      expect(centerFinder, findsWidgets);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(mockSearchNewsListNotifier.state).thenReturn(RequestState.Loaded);
      when(mockSearchNewsListNotifier.newsList).thenReturn(<News>[]);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(NewsSearchPage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display Error message when data is error",
    (WidgetTester tester) async {
      when(mockSearchNewsListNotifier.state).thenReturn(RequestState.Error);
      when(mockSearchNewsListNotifier.message).thenReturn("Error Message");

      final textfinder = find.text("Error Message");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsSearchPage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Should display empty message when when no data found",
    (WidgetTester tester) async {
      when(mockSearchNewsListNotifier.state).thenReturn(RequestState.Empty);

      final textfinder = find.text("Empty");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(NewsSearchPage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );
}
