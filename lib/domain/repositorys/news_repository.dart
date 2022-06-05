import 'package:orodomop_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:orodomop_app/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> getNews();
  Future<Either<Failure, News>> getNewsDetail(int id);
}
