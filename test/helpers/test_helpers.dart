import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/data_sources/quote_remote_data_source.dart';
import 'package:orodomop_app/domain/repositorys/quote_repository.dart';

@GenerateMocks([
  QuoteRepository,
  QuoteRemoteDataSource,
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient)
])
void main() {}
