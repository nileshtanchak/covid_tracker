import 'dart:core';
import 'package:covid_data/screens/assessment_test.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:covid_data/utility/reusable_help_container.dart';
import '../constant.dart';
import 'package:url_launcher/url_launcher.dart';

class YourStatus extends StatefulWidget {
  const YourStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<YourStatus> createState() => _YourStatusState();
}

class _YourStatusState extends State<YourStatus> {
  _launchWhatsapp() async {
    Uri url = Uri.parse("https://wa.me/918487969493");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchCertificate() async {
    Uri url = Uri.parse(
        "https://selfregistration.cowin.gov.in/dashboard");
    if (!await launchUrl(url))
      throw 'Could not launch $url';
  }

  _launchUrl() async {
    Uri url = Uri.parse("https://healthid.ndhm.gov.in/register");
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  _launchCaller(String number) async {
    Uri url = Uri.parse("tel:$number");
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  height: 160,
                  width: double.maxFinite,
                  decoration: kContainerDecoration.copyWith(
                    image: const DecorationImage(
                      image: AssetImage("images/vaccine.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("YOU ARE VACCINATED",
                              style: kStatusFirstContainerTextStyle),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text("Ministry of Health & Family Welfare",
                              style: kStatusFirstContainerTextStyle.copyWith(
                                  fontSize: 13.0)),
                          InkWell(
                            onTap: () {
                              _launchCertificate();
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              height: 50,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade800,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                border: Border.all(color: Colors.black26),
                              ),
                              child: const Center(
                                child: Text(
                                  "Download Certificate",
                                  style: kButtonTextStyle,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Colors.greenAccent.shade400,
                              size: 40.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    "Create New ABHA",
                    style: kHeaderTextStyle,
                  ),
                ),
                Container(
                  height: 170,
                  width: double.maxFinite,
                  decoration: kContainerDecoration.copyWith(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Enabling longitudinal electronic ",
                              style: kABHATextStyle,
                            ),
                            const Text(
                              "health record via Ayushman ",
                              style: kABHATextStyle,
                            ),
                            const Text(
                              "Bharat Health Account (ABHA)",
                              style: kABHATextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: InkWell(
                                onTap: () {
                                  _launchUrl();
                                },
                                child: Container(
                                  height: 50,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade800,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                    border: Border.all(color: Colors.black26),
                                  ),
                                  child: const Center(
                                    child: Text("Create/Access ABHA",
                                        style: kButtonTextStyle),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 80,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/images.jpeg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    "Why Create ABHA?",
                    style: kHeaderTextStyle,
                  ),
                ),
                YoutubePlayerIFrame(
                  controller: YoutubePlayerController(
                      initialVideoId: '9iIX4PBplAY',
                      params: const YoutubePlayerParams(
                        showFullscreenButton: true,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    "Labs Nearby",
                    style: kHeaderTextStyle,
                  ),
                ),
                Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: kContainerDecoration.copyWith(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Lookup nearby diagnostic labs",
                              style: kABHATextStyle,
                            ),
                            const Text(
                              "for sample collection",
                              style: kABHATextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 50,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade800,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: const Center(
                                  child:
                                  Text("View Now", style: kButtonTextStyle),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 130,
                              width: 115,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/labs.jpeg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    "Hospital Nearby",
                    style: kHeaderTextStyle,
                  ),
                ),
                Container(
                  height: 150,
                  width: double.maxFinite,
                  decoration: kContainerDecoration.copyWith(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "COVID-19 care",
                              style: kABHATextStyle,
                            ),
                            const Text(
                              "hospital and",
                              style: kABHATextStyle,
                            ),
                            const Text(
                              "isolation centres",
                              style: kABHATextStyle,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 50,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade800,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: const Center(
                                  child:
                                  Text("View Now", style: kButtonTextStyle),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 120,
                              width: 200,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/hospital.jpg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10),
                  child: Text(
                    "Hospital Nearby",
                    style: kHeaderTextStyle,
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3,
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(-2.0, 2.0),
                        blurRadius: 3,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: Icons.headphones,
                              helplineNumber: "1075",
                              helpInfo: "Helth Ministry",
                              text: "Helpline",
                              colour: Colors.black,
                              insets:
                              const EdgeInsets.fromLTRB(15, 15, 7.5, 7.5),
                              ontap: () {
                                _launchCaller("1075");
                              },
                            ),
                          ),
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: Icons.wc_rounded,
                              helplineNumber: "1098",
                              helpInfo: "child Helpline",
                              text: "",
                              colour: Colors.blue,
                              insets:
                              const EdgeInsets.fromLTRB(7.5, 15, 15, 7.5),
                              ontap: () {
                                _launchCaller("1098");
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: FontAwesomeIcons.headSideVirus,
                              helplineNumber: "08046110007",
                              helpInfo: "Mental Health",
                              text: "Helpline",
                              colour: Colors.red,
                              insets:
                              const EdgeInsets.fromLTRB(15, 7.5, 7.5, 7.5),
                              ontap: () {
                                _launchCaller("08046110007");
                              },
                            ),
                          ),
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: Icons.people_alt_outlined,
                              helplineNumber: "14567",
                              helpInfo: "senior Citizens",
                              text: "Helpline",
                              colour: Colors.black,
                              insets:
                              const EdgeInsets.fromLTRB(7.5, 7.5, 15, 7.5),
                              ontap: () {
                                _launchCaller("14567");
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: FontAwesomeIcons.bowlRice,
                              helplineNumber: "14443",
                              helpInfo: "Ayush Covid-19",
                              text: "counselling Helpline",
                              colour: Colors.green,
                              insets:
                              const EdgeInsets.fromLTRB(15, 7.5, 7.5, 15),
                              ontap: () {
                                _launchCaller("14443");
                              },
                            ),
                          ),
                          Expanded(
                            child: ReusableHelpContainer(
                              icons: Icons.whatsapp_outlined,
                              helplineNumber: "9013151515",
                              helpInfo: "MyGov WhatsApp",
                              text: "Helpdesk",
                              colour: Colors.green,
                              insets:
                              const EdgeInsets.fromLTRB(7.5, 7.5, 15, 15),
                              ontap: () {
                                _launchWhatsapp();
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white70,
              Colors.white54,
              Colors.white30,
              Colors.transparent
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AssessmentTest(),
                    ),
                  );
                },
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        FontAwesomeIcons.stethoscope,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Text(
                        "Assess Again",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _launchCaller("1075");
                },
                child: Container(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                        size: 17,
                      ),
                      Text(
                        "  Call Helpline",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
