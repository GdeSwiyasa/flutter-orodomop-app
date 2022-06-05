import 'package:get_it/get_it.dart';
import 'package:orodomop_app/data/data_sources/news_remote_data_source.dart';
import 'package:orodomop_app/data/repositorys/news_repository_impl.dart';
import 'package:orodomop_app/domain/repositorys/news_repository.dart';
import 'package:orodomop_app/domain/usecases/get_news.dart';
import 'package:orodomop_app/presentation/provider/news_list_notifier.dart';

import 'common/ssl_pinning.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => NewsListNotifier(
      getNews: locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNews(locator()));

  // repository
  locator.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
