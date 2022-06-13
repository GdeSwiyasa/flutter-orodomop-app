import 'package:dartz/dartz.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/repositorys/news_repository.dart';

class SearchNews {
  final NewsRepository repository;

  SearchNews(this.repository);

  Future<Either<Failure, List<News>>> execute(String query) {
    return repository.searchNews(query);
  }
}
