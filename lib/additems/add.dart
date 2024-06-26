import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/Screen/recognization_page.dart';
import 'package:ocr/Widgets/modal_dialog.dart';
import 'package:ocr/controller/maincontroller.dart';
import 'dart:developer';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyController());
    final RecognizeController controller1 = Get.put(RecognizeController());
    return SafeArea(
      child: Scaffold(
          body: Text(
              "total item in bag=${controller1.cumulativeList.length.toString()}"),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 197, 192, 192),
            title: Center(child: Text("items added")),
          ),
          // body: ,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.grey,
            onPressed: () {
              imagePickerModal(context, onCameraTap: () {
                log("Camera");
                controller.pickImage(source: ImageSource.camera).then((value) {
                  if (value.isNotEmpty) {
                    controller
                        .imageCropperView(value, context)
                        .then((croppedValue) {
                      if (croppedValue.isNotEmpty) {
                        // Get.to(() => RecognizePage(path: croppedValue));
                        controller1.processImage(croppedValue);
                      }
                    });
                  }
                });
              }, onGalleryTap: () {
                log("Gallery");
                controller.pickImage(source: ImageSource.gallery).then((value) {
                  if (value.isNotEmpty) {
                    controller
                        .imageCropperView(value, context)
                        .then((croppedValue) {
                      if (croppedValue.isNotEmpty) {
                        controller1.processImage(croppedValue);
                      }
                    });
                  }
                });
              });
            },
            tooltip: 'Increment',
            label: const Icon(
              Icons.add,
              color: Colors.red,
            ),
          )
          // body: ,
          ),
    );
  }
}
