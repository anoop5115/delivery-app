// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:string_similarity/string_similarity.dart';

// class RecognizeController extends GetxController {
//   var isBusy = false.obs;
//   var cumulativeList = <String>[].obs;

//   Future<void> processImage(String path) async {
//     isBusy.value = true;

//     final textRecognizer = GoogleMlKit.vision.textRecognizer();
//     final inputImage = InputImage.fromFilePath(path);

//     try {
//       final RecognizedText recognizedText =
//           await textRecognizer.processImage(inputImage);
//       String s = recognizedText.text;
//       List<String> lst = s.split('\n');

//       double calculateSimilarity(String a, String b) {
//         return StringSimilarity.compareTwoStrings(a, b) * 100;
//       }

//       bool removing = false;
//       var filteredList =
//           <String>[]; // Create a new list to hold the filtered items

//       for (String line in lst) {
//         if (removing) {
//           if (line.toLowerCase().startsWith("xpress bees") ||
//               line.toLowerCase().startsWith("shadowfax") ||
//               line.toLowerCase().startsWith("valmo")) {
//             removing = false;
//             filteredList.add(line);
//             break;
//           }
//         } else {
//           if (calculateSimilarity(line, "If undelivered, return to:") >= 55) {
//             removing = true;
//           } else {
//             filteredList.add(line);
//           }
//         }
//       }

//       cumulativeList
//           .addAll(filteredList); // Add the filtered list to the cumulative list
//     } catch (e) {
//       log(e.toString());
//     } finally {
//       isBusy.value = false;
//       // textRecognizer.close();
//     }
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:string_similarity/string_similarity.dart';

class RecognizeController extends GetxController {
  var isBusy = false.obs;
  var cumulativeList = <List<String>>[].obs;

  Future<void> processImage(String path, BuildContext context) async {
    isBusy.value = true;

    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final inputImage = InputImage.fromFilePath(path);

    try {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      String s = recognizedText.text;
      List<String> lst = s.split('\n');

      double calculateSimilarity(String a, String b) {
        return StringSimilarity.compareTwoStrings(a, b) * 100;
      }

      bool removing = false;
      var filteredList =
          <String>[]; // Create a new list to hold the filtered items

      for (String line in lst) {
        if (removing) {
          if (line.toLowerCase().startsWith("xpress bees") ||
              line.toLowerCase().startsWith("shadowfax") ||
              line.toLowerCase().startsWith("valmo")) {
            removing = false;
            filteredList.add(line);
            break;
          }
        } else {
          if (calculateSimilarity(line, "If undelivered, return to:") >= 55) {
            removing = true;
          } else {
            filteredList.add(line);
          }
        }
      }

      cumulativeList
          .add(filteredList); // Add the filtered list to the cumulative list

      // Show dialog box indicating "item added"
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Success",
              style: TextStyle(
                  color: Color.fromARGB(255, 92, 112, 202),
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Item added",
              style: TextStyle(
                  color: Color.fromARGB(255, 92, 112, 202),
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Color.fromARGB(255, 92, 112, 202),
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      log(e.toString());
    } finally {
      isBusy.value = false;
      // textRecognizer.close();
    }
  }
}
