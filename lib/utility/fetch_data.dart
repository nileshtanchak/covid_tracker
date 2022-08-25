import 'dart:convert';

import "package:http/http.dart" as http;

import '../components/covid_data.dart';

class FetchData {
  Uri url = Uri.parse("https://api.rootnet.in/covid19-in/stats/latest");

  Future<CovidData> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return CovidData.fromJson(decodedResponse);
    } else {
      throw Exception("No data available");
    }
  }
}
