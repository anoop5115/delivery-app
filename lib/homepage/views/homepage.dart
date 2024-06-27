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
    final RecognizeController controller = Get.put(RecognizeController());

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Items to deliver",
            style: TextStyle(
                color: Color.fromARGB(255, 92, 112, 202),
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway'),
          ),
          bottom: TabBar(
            labelColor: Color.fromARGB(255, 92, 112, 202),
            indicatorColor: Color.fromARGB(255, 92, 112, 202),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Xpress Bees'),
              Tab(text: 'Shadowfax'),
              Tab(text: 'Valmo'),
            ],
          ),
        ),
        body: Obx(() => controller.isBusy.value
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                children: [
                  _buildListView(controller.cumulativeList),
                  _buildListView(controller.cumulativeList
                      .where((list) => list.any(
                          (line) => line.toLowerCase().contains('xpress bees')))
                      .toList()),
                  _buildListView(controller.cumulativeList
                      .where((list) => list.any(
                          (line) => line.toLowerCase().contains('shadowfax')))
                      .toList()),
                  _buildListView(controller.cumulativeList
                      .where((list) => list
                          .any((line) => line.toLowerCase().contains('valmo')))
                      .toList()),
                ],
              )),
      ),
    );
  }

  Widget _buildListView(List<List<String>> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 231, 233, 253)),
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
                      children: list[index]
                          .map((line) => Text(
                                line,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 64, 64, 64)),
                              ))
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
                          backgroundColor: Color.fromARGB(255, 92, 112, 202)),
                      onPressed: () {},
                      child: Text(
                        "delivered",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.white),
                      onPressed: () {},
                      child: Text(" cancel ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 92, 112, 202))))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
