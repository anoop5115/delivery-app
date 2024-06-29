import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr/Screen/recognization_page.dart';
import 'package:ocr/Widgets/modal_dialog.dart';
import 'package:ocr/controller/maincontroller.dart';
import 'package:string_similarity/string_similarity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecognizeController controller = Get.put(RecognizeController());
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String selectedTab = 'All';
  String filterPincode = '';
  String filterLocation = '';

  @override
  Widget build(BuildContext context) {
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
            onTap: (index) {
              setState(() {
                selectedTab =
                    ['All', 'Xpress Bees', 'Shadowfax', 'Valmo'][index];
              });
            },
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Xpress Bees'),
              Tab(text: 'Shadowfax'),
              Tab(text: 'Valmo'),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Color.fromARGB(255, 92, 112, 202)),
                ),
                child: Column(
                  children: [
                    _buildSearchField(
                      controller: _pincodeController,
                      hintText: 'Enter Pincode',
                      icon: Icons.search,
                      onChanged: (value) {
                        setState(() {
                          filterPincode = value;
                        });
                      },
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 1,
                      height: 1,
                    ),
                    _buildSearchField(
                      controller: _locationController,
                      hintText: 'Enter Location',
                      icon: Icons.location_on,
                      onChanged: (value) {
                        setState(() {
                          filterLocation = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() => controller.isBusy.value
                  ? Center(child: CircularProgressIndicator())
                  : TabBarView(
                      children: [
                        _buildListView(controller.cumulativeList),
                        _buildListView(controller.cumulativeList
                            .where((list) => list.any((line) =>
                                line.toLowerCase().contains('xpressbees')))
                            .toList()),
                        _buildListView(controller.cumulativeList
                            .where((list) => list.any((line) =>
                                line.toLowerCase().contains('shadowfax')))
                            .toList()),
                        _buildListView(controller.cumulativeList
                            .where((list) => list.any(
                                (line) => line.toLowerCase().contains('valmo')))
                            .toList()),
                      ],
                    )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: Color.fromARGB(255, 92, 112, 202)),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildListView(List<List<String>> list) {
    List<List<String>> filteredList = list;

    if (filterPincode.isNotEmpty) {
      filteredList = filteredList.where((address) {
        return address.any((line) {
          final regex = RegExp(r'\b\d{6}\b');
          return regex.hasMatch(line) && line.contains(filterPincode);
        });
      }).toList();
    }

    if (filterLocation.isNotEmpty) {
      filteredList = filteredList.where((address) {
        return address.any((line) {
          // Split line into words, remove non-alphanumeric characters
          List<String> words = line.split(RegExp(r'\W+'));
          return words.any((word) {
            double similarity = StringSimilarity.compareTwoStrings(
                word.toLowerCase(), filterLocation.toLowerCase());
            return similarity >= 0.65;
          });
        });
      }).toList();
    }

    return ListView.builder(
      itemCount: filteredList.length,
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
                      children: filteredList[index]
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