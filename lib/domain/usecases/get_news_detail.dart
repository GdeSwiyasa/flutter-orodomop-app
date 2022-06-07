import 'package:dartz/dartz.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/repositorys/news_repository.dart';

class GetNewsDetail {
  final NewsRepository repository;

  GetNewsDetail(this.repository);

  Future<Either<Failure, News>> execute(int id) {
    return repository.getNewsDetail(id);
  }
}
