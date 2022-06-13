import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/domain/usecases/search_news.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockNewsRepository repository;
  late SearchNews usecase;

  setUp(() {
    repository = MockNewsRepository();
    usecase = SearchNews(repository);
  });

  group("GetSearchNews test", () {
    test("should get Search News from the repository", () async {
      when(usecase.execute(testQuery))
          .thenAnswer((_) async => Right(testListNews));

      final result = await usecase.execute(testQuery);

      expect(result, Right(testListNews));
    });
  });
}
