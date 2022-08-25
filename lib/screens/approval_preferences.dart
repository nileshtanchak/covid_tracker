import 'package:covid_data/constant.dart';
import 'package:flutter/material.dart';

class ApprovalPreferences extends StatefulWidget {
  const ApprovalPreferences({Key? key}) : super(key: key);

  @override
  State<ApprovalPreferences> createState() => _ApprovalPreferencesState();
}

class _ApprovalPreferencesState extends State<ApprovalPreferences>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Approval Preferences",
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          overlayColor: MaterialStateProperty.all(Colors.blue),
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "APPS",
            ),
            Tab(
              text: "USERS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Text(
                "currently there are no external apps accessing your Aarogya Setu status.",
                maxLines: 2,
                style: kBasicTextStyle.copyWith(color: Colors.black54),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Text(
                "currently there are no external users accessing your Aarogya Setu status.",
                maxLines: 2,
                style: kBasicTextStyle.copyWith(color: Colors.black54),
              ),
            ),
          )
        ],
      ),
    );
  }
}
