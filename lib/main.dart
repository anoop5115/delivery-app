// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ocr/Screen/recognization_page.dart';
// import 'package:ocr/Utils/image_cropper_page.dart';
// import 'package:ocr/Utils/image_picker_class.dart';
// import 'package:ocr/Widgets/modal_dialog.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           imagePickerModal(context, onCameraTap: () {
//             log("Camera");
//             pickImage(source: ImageSource.camera).then((value) {
//               if (value != '') {
//                 imageCropperView(value, context).then((value) {
//                   if (value != '') {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (_) => RecognizePage(
//                           path: value,
//                         ),
//                       ),
//                     );
//                   }
//                 });
//               }
//             });
//           }, onGalleryTap: () {
//             log("Gallery");
//             pickImage(source: ImageSource.gallery).then((value) {
//               if (value != '') {
//                 imageCropperView(value, context).then((value) {
//                   if (value != '') {
//                     Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                         builder: (_) => RecognizePage(
//                           path: value,
//                         ),
//                       ),
//                     );
//                   }
//                 });
//               }
//             });
//           });
//         },
//         tooltip: 'Increment',
//         label: const Text("Scan photo"),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/Screen/recognization_page.dart';
import 'package:ocr/Widgets/modal_dialog.dart';
import 'package:ocr/controller/maincontroller.dart';
import 'package:ocr/homepage/views/homepage.dart';
import 'package:ocr/homepage/views/homescreen.dart';
// import 'recognization_page.dart';
// import 'image_cropper_page.dart'; // Update with your correct import paths
// import 'image_picker_class.dart'; // Update with your correct import paths
// import 'modal_dialog.dart'; // Update with your correct import paths

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     final MyController controller = Get.put(MyController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Obx(() => Text(
//                   '${controller.counter}',
//                   style: Theme.of(context).textTheme.headline4,
//                 )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           imagePickerModal(context, onCameraTap: () {
//             log("Camera");
//             controller.pickImage(source: ImageSource.camera).then((value) {
//               if (value.isNotEmpty) {
//                 controller
//                     .imageCropperView(value, context)
//                     .then((croppedValue) {
//                   if (croppedValue.isNotEmpty) {
//                     Get.to(() => RecognizePage(path: croppedValue));
//                   }
//                 });
//               }
//             });
//           }, onGalleryTap: () {
//             log("Gallery");
//             controller.pickImage(source: ImageSource.gallery).then((value) {
//               if (value.isNotEmpty) {
//                 controller
//                     .imageCropperView(value, context)
//                     .then((croppedValue) {
//                   if (croppedValue.isNotEmpty) {
//                     Get.to(() => RecognizePage(path: croppedValue));
//                   }
//                 });
//               }
//             });
//           });
//         },
//         tooltip: 'Increment',
//         label: const Text("Scan photo"),
//       ),
//     );
//   }
// }
