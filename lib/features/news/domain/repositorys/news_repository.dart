import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/features/news/domain/entities/news.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getNews();
  Future<Either<Failure, News>> getNewsDetail(int id);
}
