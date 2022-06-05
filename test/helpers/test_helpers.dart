import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/data_sources/news_remote_data_source.dart';
import 'package:orodomop_app/domain/repositorys/news_repository.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
