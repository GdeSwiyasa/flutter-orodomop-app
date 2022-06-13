import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:orodomop_app/common/locale/locale_keys.g.dart';
import 'package:orodomop_app/data/data_sources/news_remote_data_source.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/repositorys/news_repository.dart';

import '../../../../common/excepsion.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<News>>> getNews() async {
    try {
      final result = await remoteDataSource.getNews(LocaleKeys.locale.tr());
      return Right(result.map((e) => e.toEntitie()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException catch (e) {
      return Left(CommonFailure('Certificated not valid\n${e.message}'));
    }
  }


  @override
  Future<Either<Failure, List<News>>> searchNews(String query) async{
    try {
      final result = await remoteDataSource.searchNews(query, LocaleKeys.locale.tr());
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
