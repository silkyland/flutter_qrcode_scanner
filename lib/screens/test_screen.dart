import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qrcode_scanner/screens/sencond_route.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

enum items { orange, banana }

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Screen")),
      body: Container(
        child: Center(
          child: Form(
            child: ListView(
              children: [
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                ListTile(
                  title: const Text('Orange'),
                  leading: Radio(
                    groupValue: items,
                    onChanged: (x) {},
                    value: items.orange,
                  ),
                ),
                ListTile(
                  title: const Text('Banana'),
                  leading: Radio(
                    groupValue: items,
                    onChanged: (x) {},
                    value: items.banana,
                  ),
                ),
                DropdownButton(
                  hint: Text("please check"),
                  items: [
                    DropdownMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Text("Button"),
                    ),
                    DropdownMenuItem(
                      onTap: () {},
                      value: 1,
                      child: Text("Button"),
                    )
                  ],
                  onChanged: (int value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
