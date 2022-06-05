import 'package:mockito/annotations.dart';
import 'package:orodomop_app/features/news/data/data_sources/news_remote_data_source.dart';
import 'package:orodomop_app/features/news/domain/repositorys/news_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([
  NewsRepository,
  NewsRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
