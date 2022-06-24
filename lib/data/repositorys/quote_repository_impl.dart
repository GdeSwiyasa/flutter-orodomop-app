import 'dart:io';
import 'package:orodomop_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:orodomop_app/data/data_sources/quote_remote_data_source.dart';
import 'package:orodomop_app/domain/entities/quote.dart';
import 'package:orodomop_app/domain/repositorys/quote_repository.dart';

import '../../../../common/excepsion.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Quote>>> getQuote() async {
    try {
      final result = await remoteDataSource.getQuote();
      return Right(result.map((e) => e.toEntitie()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    }
  }
}
