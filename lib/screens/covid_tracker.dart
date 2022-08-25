import 'package:covid_data/constant.dart';
import 'package:covid_data/screens/scan_qr_code.dart';
import 'package:covid_data/screens/settings.dart';
import 'package:covid_data/screens/vaccination.dart';
import 'package:covid_data/screens/your_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/covid_data.dart';
import '../utility/fetch_data.dart';
import '../utility/reusable_container.dart';

import 'covid_update.dart';

class CovidTracker extends StatefulWidget {
  const CovidTracker({Key? key}) : super(key: key);

  @override
  State<CovidTracker> createState() => _CovidTrackerState();
}

class _CovidTrackerState extends State<CovidTracker>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  bool selectedButton = false;
  int selectedIndex = 0;

  Future<AlertDialog> alertDialog() async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 30,
                  ),
                )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: Icon(
                    Icons.note_alt_sharp,
                    size: 80,
                    color: Colors.red,
                  ),
                ),
                Text(
                  "Your data is always saved on your phone. share it on secure Government Server if...",
                  style: kStateDataTextStyle.copyWith(fontSize: 15),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red, width: 2)),
                  child: const Center(
                    child: Text(
                      "Sample Collection for Testing",
                      style: kDataTextStyle,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red, width: 2)),
                  child: Center(
                    child: Text(
                      "Tested Positive for Covid19",
                      style: kDataTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  // Icon customIcon = Icon(Icons.search);
  //
  // Widget openTextField() {
  //   if (customIcon.icon == Icons.search) {
  //     return TextField(
  //       controller: _textEditingController,
  //       focusNode: _focusNode,
  //       decoration: InputDecoration(
  //         hintText: "search",
  //         suffixIcon: Icon(Icons.close),
  //       ),
  //     );
  //   } else {
  //     return customIcon = Icon(Icons.search);
  //   }
  // }

  _launchCaller(String number) async {
    Uri url = Uri.parse("tel:$number");
    await launchUrl(url);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    trackCovidData();
  }

  void trackCovidData() async {
    FetchData fetchData = FetchData();
    covidData = await fetchData.getData();
  }

  CovidData covidData = CovidData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Covid Tracker",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // openTextField();
              setState(() {
                // openTextField();
              });
            },
            icon: Icon(Icons.search_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              leading: Image.asset(
                "images/user.jpg",
              ),
              title: const Text(
                "+917984251709",
                style: kHeaderTextStyle,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.qr_code_scanner,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                "Generate/Scan QR Code",
                style: kHeaderTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ScanQrCode(),
                ));
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: Image.asset(
                "images/volunteer.png",
                height: 25,
                width: 30,
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Status Check",
                  style: kHeaderTextStyle,
                ),
              ),
              subtitle: const Text(
                "Keep a check on Aarogya Setu status of your close ones from one place.",
                maxLines: 3,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.app_registration_rounded,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                "Approvals",
                style: kHeaderTextStyle,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.dangerous,
                color: Colors.red,
                size: 30,
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Share Data with Govt.",
                  style: kHeaderTextStyle,
                ),
              ),
              subtitle: const Text(
                "Share only if you have tested positive for COVID-19 or are urgently being tested",
                maxLines: 3,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              onTap: () {
                alertDialog();
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                size: 30,
                color: Colors.black,
              ),
              title: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Call Helpline (1075)",
                  style: kHeaderTextStyle,
                ),
              ),
              subtitle: const Text(
                "Health ministry toll-free helpline for queries related to COVID-19",
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              onTap: () {
                _launchCaller("1075");
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 30,
                color: Colors.black,
              ),
              title: const Text(
                "Settings",
                style: kHeaderTextStyle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Privacy Policy",
                    style: kDataTextStyle.copyWith(
                        color: Colors.blue, fontSize: 16),
                  ),
                  Text(
                    "Terms of use",
                    style: kDataTextStyle.copyWith(
                        color: Colors.blue, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        "App version ",
                        style: kDataTextStyle.copyWith(
                            color: Colors.black26, fontSize: 16),
                      ),
                      Text(
                        "2.0.1",
                        style: kDataTextStyle.copyWith(
                            color: Colors.black54, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Column(
              children: [
                const Text(
                  "latest update of covid-19.",
                  style: kBasicTextStyle,
                ),
                TabBar(
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  controller: _tabController,
                  tabs: <Widget>[
                    ReusableContainer(
                      selectedIndex: selectedIndex == 0
                          ? Border.all(color: Colors.blue)
                          : Border.all(color: Colors.white),
                      icons: FontAwesomeIcons.heartCircleCheck,
                      colour: const Color(0xffD97935),
                    ),
                    ReusableContainer(
                      selectedIndex: selectedIndex == 1
                          ? Border.all(color: Colors.blue)
                          : Border.all(color: Colors.white),
                      icons: FontAwesomeIcons.virusCovid,
                      colour: const Color(0xff8C3F3F),
                    ),
                    ReusableContainer(
                      selectedIndex: selectedIndex == 2
                          ? Border.all(color: Colors.blue)
                          : Border.all(color: Colors.white),
                      icons: FontAwesomeIcons.bullhorn,
                      colour: const Color(0xff3B2A86),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      "Your Status",
                      style: kNameTextStyle,
                    ),
                    Text(
                      "Vaccination",
                      style: kNameTextStyle,
                    ),
                    Text(
                      "Covid Update",
                      style: kNameTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
            child: Divider(
              thickness: 1,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const YourStatus(),
                const Vaccination(),
                CovidUpdate(covidData: covidData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
