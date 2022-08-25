import 'package:covid_data/utility/reusable_vaccine_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class VaccineContainer extends StatelessWidget {
  const VaccineContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: const [
              Icon(
                Icons.radio_button_on_outlined,
                color: Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Useful Resources",
                style: kABHATextStyle,
              ),
            ],
          ),
        )
        ,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: 130,
          width: double.maxFinite,
          decoration: kContainerDecoration.copyWith(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      FontAwesomeIcons.circleCheck,
                      color: Colors.blue,
                      size: 45,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Verify and Share vaccinate",
                        style: kHeaderTextStyle,
                      ),
                      const Text(
                        "Status",
                        style: kHeaderTextStyle,
                      ),
                      Text(
                        "Now you can share your certificate",
                        style: kNameTextStyle.copyWith(fontSize: 11),
                      ),
                      Text(
                        "through Aarogya Setu",
                        style: kNameTextStyle.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 25,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                    ),
                    child: const Center(
                        child: Text("New",
                            style: TextStyle(
                                color: Colors.white, fontSize: 11))),
                  ),
                ],
              ),
            ],
          ),
        ),
        const ReusableVaccineCard(
          icons: FontAwesomeIcons.circleInfo,
          info: "Vaccination Information",
          message: "Watch Videos related to COVID-19 Vaccines and",
          text: "other related information",
        ),
        const ReusableVaccineCard(
          icons: FontAwesomeIcons.briefcaseMedical,
          info: "Vaccine Availability",
          message: "Search for Vaccination Center by PIN Code or State",
          text: "and Districts",
        ),
        const ReusableVaccineCard(
          icons: FontAwesomeIcons.notesMedical,
          info: "Vaccination Dashboard",
          message: "Watch real time statistics for coWIN Registration",
          text: "Vaccination and others",
        ),
        const ReusableVaccineCard(
            icons: FontAwesomeIcons.message,
            info: "Frequently Asked Questions",
            message: "FAQ regarding Registration, Scheduling Appointment",
            text: "Vaccination, Vaccination Certificate etc"),
      ],
    );
  }
}
