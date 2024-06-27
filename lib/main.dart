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
