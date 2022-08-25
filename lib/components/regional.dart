class Regional {
  final String loc;
  final int confirmedCasesIndian;
  final int confirmedCasesForeign;
  final int discharged;
  final int deaths;
  final int totalConfirmed;

  Regional({
    this.loc = "",
    this.confirmedCasesIndian = 0,
    this.confirmedCasesForeign = 0,
    this.discharged = 0,
    this.deaths = 0,
    this.totalConfirmed = 0,

  });

  factory Regional.fromJson(Map<String, dynamic> json) =>
      Regional(
        loc: json["loc"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        totalConfirmed:
        json["totalConfirmed"],
      );
}
