import 'package:dartz/dartz.dart';
import 'package:orodomop_app/domain/entities/quote.dart';
import 'package:orodomop_app/domain/repositorys/quote_repository.dart';

import '../../common/failure.dart';

class GetQuote {
  final QuoteRepository repository;
  GetQuote(this.repository);

  Future<Either<Failure, List<Quote>>> execute() {
    return repository.getQuote();
  }
}
