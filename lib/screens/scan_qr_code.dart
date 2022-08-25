import 'package:covid_data/constant.dart';
import 'package:covid_data/screens/qr_code_scanner.dart';
import "package:flutter/material.dart";

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({Key? key}) : super(key: key);

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 35,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      const CircularProgressIndicator();
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.refresh,
                          size: 30,
                          color: Colors.blue,
                        ),
                        Text("Refresh",
                            style: TextStyle(fontSize: 15, color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Tanchak Nilesh Ramjibhai",
              style: kHeaderTextStyle.copyWith(fontSize: 25),
            ),
            const Text(
              "+917984251709",
              style: TextStyle(fontSize: 20),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              child: Image(
                image: AssetImage("images/qr_mygov.png"),
              ),
            ),
            const Expanded(
              child: Text(
                "Scan QR Code to get health status",
                style: kHeaderTextStyle,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodeScanner(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Scan QR Code",
                    style: kHeaderTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
