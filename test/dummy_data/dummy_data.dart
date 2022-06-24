import 'dart:convert';
import 'dart:io';
import 'package:orodomop_app/data/models/notes.dart';
import 'package:orodomop_app/data/models/quote_model.dart';
import 'package:orodomop_app/data/models/quote_response.dart';
import 'package:orodomop_app/domain/entities/quote.dart';

import '../json_reader.dart';

final testQuote = Quote(
    quote:
        "You don't need anybody to tell you who you are or what you are. You are what you are!",
    author: 'John Lennon');

final testQuoteModel = QuoteModel(
  quote:
      "You don't need anybody to tell you who you are or what you are. You are what you are!",
  author: "John Lennon",
);

final testNotes = NotesTable(
  id: 1,
  title: 'title',
  contents: 'contents',
);

final testQuoteResponseModel =
    QuoteResponse(quoteList: <QuoteModel>[testQuoteModel]);

final testListQuoteModel = <QuoteModel>[testQuoteModel];

final testListNews = <Quote>[testQuote];

final testQuoteList =
    QuoteResponse.fromJson(json.decode(readJson('dummy_data/quote_list.json')))
        .quoteList;

const testId = 1;

String jsonString(String name) =>
    File("test/dummy_data/$name").readAsStringSync();
