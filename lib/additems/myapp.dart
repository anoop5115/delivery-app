import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class MyApp1 extends StatefulWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  @override
  void initState() {
    super.initState();
  }

  Color containerColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: InkWell(
            onTap: () async {
              await LaunchApp.openApp(
                  androidPackageName: 'com.loadshare.deliveryapp');
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 37, 16, 77),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "Loadshare".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ),
        Center(
          child: InkWell(
            onTap: () async {
              await LaunchApp.openApp(
                  androidPackageName: 'com.xpressbees.unified_new_arch');
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "Xpressbees".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ),
        Center(
          child: InkWell(
            onTap: () async {
              await LaunchApp.openApp(
                  androidPackageName: 'in.shadowfax.gandalf');
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 251, 100, 0),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "SHADOW FAX",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
        ),
      ],
    ));
  }
}
