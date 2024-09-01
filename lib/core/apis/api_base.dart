import '../resources/enum.dart';

late String baseUrl;
late String websiteUrl;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  switch (env) {
    case Environment.production:
      baseUrl = 'https://rickandmortyapi.com/api';
      websiteUrl = 'https://rickandmortyapi.com';
      break;
    case Environment.development:
      baseUrl = 'https://rickandmortyapi.com/api';
      websiteUrl = 'https://rickandmortyapi.com';
      break;
  }
}
