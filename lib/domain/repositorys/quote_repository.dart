import 'package:dartz/dartz.dart';
import 'package:orodomop_app/domain/entities/quote.dart';

import '../../common/failure.dart';

abstract class QuoteRepository {
  Future<Either<Failure, List<Quote>>> getQuote();
}
