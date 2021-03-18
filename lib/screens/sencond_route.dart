import 'package:flutter/material.dart';

class SecondRouteScreen extends StatefulWidget {
  final String title;
  SecondRouteScreen({this.title});

  @override
  _SecondRouteScreenState createState() => _SecondRouteScreenState();
}

class _SecondRouteScreenState extends State<SecondRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back to previous page"),
        ),
      ),
    );
  }
}
