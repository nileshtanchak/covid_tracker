import 'package:covid_data/components/data.dart';

class CovidData {
  final Data? data;
  final String lastRefreshed;

  CovidData({
    this.data,
    this.lastRefreshed = "",
  });

  factory CovidData.fromJson(Map<String, dynamic> json) => CovidData(
        data: Data.fromJson(json["data"]),
        lastRefreshed: json["lastRefreshed"],
      );
}
