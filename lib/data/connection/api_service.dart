import 'dart:convert';

import 'package:coronavirusapp/data/connection/api.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Api api;
  ApiService({
    required this.api,
  });
  Future<String> getAccessTocken() async {
    final responce = await http.post(api.tokenUri(),
        headers: {'Authorization': 'Basic ${api.apiKey}'});
    if (responce.statusCode == 200) {
      final accessToken = jsonDecode(responce.body)['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    throw responce;
  }

  Future<int> getEndpointData(
      {required Endpoints endpoint, required String accessToken}) async {
    final responce = await http.get(api.endPointUri(endpoint),
        headers: {'Authorization': 'Bearer $accessToken'});
    if (responce.statusCode == 200) {
      final List<dynamic> data = json.decode(responce.body);
      if (data.isNotEmpty) {
      Map<String, dynamic> endpointData = data[0];
      final String? responseJsonKey = responseJsonKeys[endpoint];
      final int result = endpointData[responseJsonKey];
      return result;}
    }
    throw responce;
  }

  static Map<Endpoints, String> responseJsonKeys = {
    Endpoints.cases: 'cases',
    Endpoints.casesSuspected: 'data',
    Endpoints.casesConfirmed: 'data',
    Endpoints.deaths: 'data',
    Endpoints.recovered: 'data'
  };
}
