import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  QRViewController? controller;
  Barcode? result;
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");

  //
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {});
  // }

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller?.resumeCamera();
  //   } else if (Platform.isIOS) {
  //     controller?.resumeCamera();
  //   }
  // }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  // void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
  //   log('${DateTime.now().toIso8601String()}onPermissionSet $p');
  //   if (!p) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text("No Permission"),
  //       ),
  //     );
  //   }
  // }

  Widget buildQRView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 800)
        ? 300
        : 500;

    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 50,
        borderWidth: 10,
        cutOutSize: scanArea.toDouble(),
      ),
      // onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: buildQRView(context),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                          },
                          child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (_, snapShot) {
                                return Text("Flash:- ${snapShot.data}");
                              }),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.flipCamera();
                          },
                          child: FutureBuilder(
                            future: controller?.getCameraInfo(),
                            builder: (_, snapShot) {
                              if (snapShot.data != null) {
                                return Text(
                                    'Camera facing ${describeEnum(snapShot.data!)}');
                              } else {
                                return const Text('loading');
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text("Camera Pause"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller?.pauseCamera();
                          },
                          child: const Text("Camera Resume"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
