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
          body: Column(children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 241, 243, 253),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Items\nin bag",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 92, 112, 202),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller1.cumulativeList.length.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 92, 112, 202),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 243, 253),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Items\nto deliver",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 92, 112, 202),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "3",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 92, 112, 202),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 243, 253),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Total Deliveries 15 ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 92, 112, 202),
                    ),
                  ),
                )),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 92, 112, 202),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Order History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )),
                SizedBox(
                  width: 15,
                ),
              ],
            )
          ]),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
                child: Text(
              "Your Bag",
              style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 92, 112, 202),
                  fontWeight: FontWeight.bold),
            )),
          ),
          // body: ,
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Color.fromARGB(255, 92, 112, 202),
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
                        controller1.processImage(croppedValue, context);
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
                        controller1.processImage(croppedValue, context);
                      }
                    });
                  }
                });
              });
            },
            tooltip: 'Increment',
            label: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
          // body: ,
          ),
    );
  }
}
