import 'package:covid_data/utility/vaccine_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../utility/reusable_vaccine_card.dart';

class Vaccination extends StatefulWidget {
  const Vaccination({Key? key}) : super(key: key);

  @override
  State<Vaccination> createState() => _VaccinationState();
}

class _VaccinationState extends State<Vaccination> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  int valueLength = 0;
  String text = "";

  @override
  initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  _launchURL() async {
    Uri url = Uri.parse("https://www.cowin.gov.in");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              height: 210,
              width: double.maxFinite,
              decoration: kContainerDecoration.copyWith(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Cowin Login/Register",
                      style: kHeaderTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 10),
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          valueLength = value.length;
                        });
                      },
                      style: const TextStyle(
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                      maxLength: 10,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        labelText: "Mobile Number",
                        hintStyle: const TextStyle(color: Colors.black54),
                        suffixIcon: _controller.text.isNotEmpty
                            ? InkWell(
                                child: const Icon(Icons.close_rounded),
                                onTap: () {
                                  _controller.clear();
                                  setState(() {});
                                },
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: valueLength == 10 ? _launchURL : () {},
                      child: Container(
                          height: 45,
                          width: 150,
                          decoration: kContainerDecoration.copyWith(
                            color: valueLength == 10
                                ? Colors.blue
                                : Colors.grey.shade500,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Center(
                            child: Text(
                              "Proceed to Verify",
                              style: kButtonTextStyle.copyWith(fontSize: 16.5),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            const VaccineContainer(),
          ],
        ),
      ),
    );
  }
}
