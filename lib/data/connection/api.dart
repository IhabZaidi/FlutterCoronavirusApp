import 'package:coronavirusapp/data/connection/api_keys.dart';

class Api {
  final String apiKey;
  Api({
    required this.apiKey,
  });
  factory Api.sandbox() => Api(apiKey: ApiKeys.apiKeySanbox);
  //static const int port = 443;
  static const String host = 'ncov2019-admin.firebaseapp.com';
  Uri tokenUri() => Uri(scheme: 'https', host: host, path: 'token');
  Uri endPointUri(Endpoints endpoint) =>
      Uri(scheme: 'https', host: host, path: paths[endpoint]);

  static Map<Endpoints, String> paths = {
    Endpoints.cases: 'cases',
    Endpoints.casesSuspected: 'casesSuspected',
    Endpoints.casesConfirmed: 'casesConfirmed',
    Endpoints.deaths: 'deaths',
    Endpoints.recovered: 'recovered'
  };
}

enum Endpoints { cases, casesSuspected, casesConfirmed, deaths, recovered }
