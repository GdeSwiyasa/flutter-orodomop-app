import 'package:get_it/get_it.dart';
import 'package:orodomop_app/data/data_sources/quote_remote_data_source.dart';
import 'package:orodomop_app/domain/usecases/get_quote.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';
import 'package:orodomop_app/presentation/provider/navigation_provider.dart';
import 'package:orodomop_app/presentation/provider/quote_list_notifier.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';

import 'common/ssl_pinning.dart';
import 'data/repositorys/quote_repository_impl.dart';
import 'domain/repositorys/quote_repository.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => QuoteListNotifier(
      getQuote: locator(),
    ),
  );

  locator.registerFactory(
    () => TimerProvider(),
  );

  locator.registerFactory(
    () => NotesDatabaseProvider(),
  );

  locator.registerFactory(
    () => NavigationProvider(),
  );

  locator.registerFactory(
    () => DarkThemeProvider(),
  );

  // use case
  locator.registerLazySingleton(() => GetQuote(locator()));

  // repository
  locator.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<QuoteRemoteDataSource>(
      () => QuoteRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
