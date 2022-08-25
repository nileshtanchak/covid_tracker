import 'package:covid_data/components/regional.dart';
import 'package:covid_data/components/summary.dart';

class Data {
  final Summary? summary;

  final List<Regional> regional;

  Data({
    this.summary,
    this.regional = const [],
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        summary: Summary.fromJson(json["summary"]),
        regional: (json["regional"] as List)
            .map((data) => Regional.fromJson(data))
            .toList(),
      );
}
