import 'package:covid_data/constant.dart';
import 'package:flutter/material.dart';

import 'approval_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(
                "Settings",
                style: kStateDataTextStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApprovalPreferences(),
                  ),
                );
              },
              leading: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              title: const Text(
                "Permission to Access Status",
                style: kHeaderTextStyle,
              ),
              subtitle: const Text(
                "External apps or users that can access your Aarogya setu status.",
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.delete,
                color: Colors.black,
              ),
              title: const Text(
                "Delet My Account",
                style: kHeaderTextStyle,
              ),
              subtitle: const Text(
                "You can permanently delet ypur account and wipe all data.",
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
