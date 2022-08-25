import 'package:flutter/material.dart';

import '../components/covid_data.dart';
import '../constant.dart';

class CovidUpdate extends StatefulWidget {
  const CovidUpdate({
    Key? key,
    required this.covidData,
  }) : super(key: key);

  final CovidData covidData;

  @override
  State<CovidUpdate> createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: Colors.blue.shade800,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                height: 130,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Covid-19 Cases OverView",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.covidData.lastRefreshed,
                      style: kNameTextStyle.copyWith(
                          fontSize: 11,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 70.0, left: 15.0, right: 15.0),
                height: 400,
                width: double.maxFinite,
                decoration: kContainerDecoration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.covidData.data?.regional[10].loc ?? 'N/A',
                              style: kStateDataTextStyle,
                            ),
                            const Text("Active", style: kRowTextStyle),
                            Text(
                                widget.covidData.data?.regional[10]
                                        .confirmedCasesForeign
                                        .toString() ??
                                    "N/A",
                                style: kDataTextStyle),
                            const Text("Deceased", style: kRowTextStyle),
                            Text(
                                widget.covidData.data?.regional[10].deaths
                                        .toString() ??
                                    "N/A",
                                style: kDataTextStyle.copyWith(
                                    color: Colors.black)),
                            const SizedBox(
                              width: 100,
                              child: Divider(),
                            ),
                            const Text(
                              "Across India",
                              style: kStateDataTextStyle,
                            ),
                            const Text("Active", style: kRowTextStyle),
                            Text(
                                widget.covidData.data?.summary
                                        ?.confirmedButLocationUnidentified
                                        .toString() ??
                                    "N/A",
                                style: kDataTextStyle),
                            const Text("Deceased", style: kRowTextStyle),
                            Text(
                                widget.covidData.data?.summary?.deaths
                                        .toString() ??
                                    "N/A",
                                style: kDataTextStyle.copyWith(
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 70.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            " ",
                            style: kStateDataTextStyle,
                          ),
                          const Text("Recovered", style: kRowTextStyle),
                          Text(
                              widget.covidData.data?.regional[10].discharged
                                      .toString() ??
                                  "N/A",
                              style:
                                  kDataTextStyle.copyWith(color: Colors.green)),
                          const Text("Confirmed", style: kRowTextStyle),
                          Text(
                              widget.covidData.data?.regional[10].totalConfirmed
                                      .toString() ??
                                  "N/A",
                              style: kDataTextStyle),
                          const SizedBox(
                            width: 100,
                            child: Divider(),
                          ),
                          const Text(
                            " ",
                            style: kStateDataTextStyle,
                          ),
                          const Text("Recovered", style: kRowTextStyle),
                          Text(
                              widget.covidData.data?.summary?.discharged
                                      .toString() ??
                                  "N/A",
                              style:
                                  kDataTextStyle.copyWith(color: Colors.green)),
                          const Text("Confirmed", style: kRowTextStyle),
                          Text(
                              widget.covidData.data?.summary?.total
                                      .toString() ??
                                  "N/A",
                              style: kDataTextStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: Text(
              "All State/UT Stats",
              style: kStateDataTextStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Active",
                style: kRowTextStyle.copyWith(color: Colors.red),
              ),
              Text(
                "Recovered",
                style: kRowTextStyle.copyWith(color: Colors.green),
              ),
              Text(
                "Deceased",
                style: kRowTextStyle.copyWith(color: Colors.grey.shade800),
              ),
              Text(
                "Confirmed",
                style: kRowTextStyle.copyWith(color: Colors.blue),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.covidData.data?.regional.length ?? 0,
            itemBuilder: (_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 30.0,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: Text(
                        "     ${widget.covidData.data?.regional[i].loc ?? ""}",
                        style: kRowTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.covidData.data?.regional[i]
                                    .confirmedCasesForeign
                                    .toString() ??
                                "",
                            style: kDataTextStyle.copyWith(color: Colors.red),
                          ),
                          Text(
                              widget.covidData.data?.regional[i].discharged
                                      .toString() ??
                                  "",
                              style:
                                  kDataTextStyle.copyWith(color: Colors.green)),
                          Text(
                              widget.covidData.data?.regional[i].deaths
                                      .toString() ??
                                  "",
                              style: kDataTextStyle.copyWith(
                                  color: Colors.grey.shade800)),
                          Text(
                              widget.covidData.data?.regional[i].totalConfirmed
                                      .toString() ??
                                  "",
                              style:
                                  kDataTextStyle.copyWith(color: Colors.blue)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
