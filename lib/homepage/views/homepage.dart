import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/Screen/recognization_page.dart';
import 'package:ocr/Widgets/modal_dialog.dart';
import 'package:ocr/controller/maincontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(MyController());
    final RecognizeController controller = Get.put(RecognizeController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Items to deliver"),
        ),
        body: Obx(() => controller.isBusy.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.cumulativeList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 204, 219, 226)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.cumulativeList[index]
                                    .map((line) => Text(line))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 54, 244, 124)),
                                onPressed: () {},
                                child: Text("delivered")),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 244, 73, 54)),
                                onPressed: () {},
                                child: Text("undelivered"))
                          ],
                        )
                      ],
                    ),
                  );
                })));
  }
}
