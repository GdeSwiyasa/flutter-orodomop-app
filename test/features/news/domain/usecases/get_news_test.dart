import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/usecases/get_news.dart';

import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockNewsRepository repository;
  late GetNews usecase;

  setUp(() {
    repository = MockNewsRepository();
    usecase = GetNews(repository);
  });

  final testNewsList = <News>[];

  group("GetNews test", () {
    test("should get list of News from the repository", () async {
      when(usecase.execute()).thenAnswer((_) async => Right(testNewsList));

      final result = await usecase.execute();

      expect(result, Right(testNewsList));
    });
  });
}
