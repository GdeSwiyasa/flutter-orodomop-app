import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/entities/quote.dart';
import 'package:orodomop_app/presentation/pages/quote/quote_page.dart';
import 'package:orodomop_app/presentation/provider/quote_list_notifier.dart';
import 'package:provider/provider.dart';

import 'quote_page_test.mocks.dart';

@GenerateMocks([QuoteListNotifier])
void main() {
  late MockQuoteListNotifier mockQuoteListNotifier;

  setUp(() {
    mockQuoteListNotifier = MockQuoteListNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<QuoteListNotifier>.value(
      value: mockQuoteListNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "Should display center progress bar when loading",
    (WidgetTester tester) async {
      when(mockQuoteListNotifier.state).thenReturn(RequestState.Loading);

      final progressBarFinder = find.byType(CircularProgressIndicator);
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(QuotePage()));

      expect(centerFinder, findsWidgets);
      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display ListView when data is loaded",
    (WidgetTester tester) async {
      when(mockQuoteListNotifier.state).thenReturn(RequestState.Loaded);
      when(mockQuoteListNotifier.quoteList).thenReturn(<Quote>[]);

      final listViewFinder = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget(QuotePage()));

      expect(listViewFinder, findsOneWidget);
    },
  );

  testWidgets(
    "Should display Error message when data is error",
    (WidgetTester tester) async {
      when(mockQuoteListNotifier.state).thenReturn(RequestState.Error);
      when(mockQuoteListNotifier.message).thenReturn("Error Message");

      final textfinder = find.text("Error Message");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(QuotePage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );

  testWidgets(
    "Should display Empty message when when no data found",
    (WidgetTester tester) async {
      when(mockQuoteListNotifier.state).thenReturn(RequestState.Empty);

      final textfinder = find.text("Empty");
      final centerFinder = find.byType(Center);

      await tester.pumpWidget(_makeTestableWidget(QuotePage()));

      expect(textfinder, findsOneWidget);
      expect(centerFinder, findsWidgets);
    },
  );
}
