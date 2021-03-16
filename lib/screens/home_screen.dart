import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:toast/toast.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCameraPermissionEnabled = false;

  TextEditingController textController = new TextEditingController();

  handleCheckCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      setState(() {
        isCameraPermissionEnabled = true;
      });
    }

    if (await Permission.speech.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void scan() async {
    String result = await scanner.scan();
    Toast.show("แสกนสำเร็จ", context);
    textController.text = result;
  }

  void copyClipboard() {
    Clipboard.setData(ClipboardData(text: textController.text)).then(
      (value) => Toast.show(
        "ข้อมูลถูกคัดลอกไปยังคลิปบอร์ด",
        context,
      ),
    );
  }

  void share() {
    Share.share(textController.text);
  }

  @override
  void initState() {
    handleCheckCameraPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRcode scaner"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: !isCameraPermissionEnabled
            ? Center(
                child: ElevatedButton(
                  onPressed: () => openAppSettings(),
                  child: Text("Enable camera permission"),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "กดปุ่ม Scan เพื่อเริ่ม scan :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: textController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 15,
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: copyClipboard,
                                  icon: Icon(Icons.copy),
                                  label: Text("Clipboard"),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: share,
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                                  icon: Icon(
                                    Icons.share,
                                    size: 20,
                                  ),
                                  label: Text("Share This"),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 70,
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton.icon(
                        onPressed: scan,
                        icon: Icon(Icons.camera),
                        label: Text("scan"),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
