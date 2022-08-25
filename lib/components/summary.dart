class Summary {
  final int total;
  final int confirmedCasesIndian;
  final int confirmedCasesForeign;
  final int discharged;
  final int deaths;
  final int confirmedButLocationUnidentified;

  Summary({
    this.total = 0,
    this.confirmedCasesIndian = 0,
    this.confirmedCasesForeign = 0,
    this.discharged = 0,
    this.deaths = 0,
    this.confirmedButLocationUnidentified = 0,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedButLocationUnidentified:
            json["confirmedButLocationUnidentified"],
      );
}
