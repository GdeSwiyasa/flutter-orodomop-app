import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/domain/usecases/get_news_detail.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockNewsRepository repository;
  late GetNewsDetail usecase;

  setUp(() {
    repository = MockNewsRepository();
    usecase = GetNewsDetail(repository);
  });

  group("GetNewsDetail test", () {
    test("should get NewsDetail from the repository", () async {
      when(usecase.execute(testId))
          .thenAnswer((_) async => const Right(testNews));

      final result = await usecase.execute(testId);

      expect(result, const Right(testNews));
    });
  });
}
