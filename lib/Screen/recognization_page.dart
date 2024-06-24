// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:string_similarity/string_similarity.dart';

// class RecognizePage extends StatefulWidget {
//   final String? path;
//   const RecognizePage({Key? key, this.path}) : super(key: key);

//   @override
//   State<RecognizePage> createState() => _RecognizePageState();
// }

// class _RecognizePageState extends State<RecognizePage> {
//   bool _isBusy = false;
//   List<String> emptyList = [];
//   List<String> lst = [];
//   List<String> filteredList = [];
//   TextEditingController controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     final InputImage inputImage = InputImage.fromFilePath(widget.path!);

//     processImage(inputImage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("recognized page")),
//       body: _isBusy == true
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               padding: const EdgeInsets.all(20),
//               child: ListView.builder(
//                   itemCount: filteredList.length,
//                   itemBuilder: (context, index) => Text(filteredList[index]))),
//     );
//   }

//   void processImage(InputImage image) async {
//     final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

//     setState(() {
//       _isBusy = true;
//     });

//     log(image.filePath!);
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(image);
//     String s = recognizedText.text;
//     lst = s.split('\n');

//     double calculateSimilarity(String a, String b) {
//       return StringSimilarity.compareTwoStrings(a, b) * 100;
//     }

//     bool removing = false;

//     for (String line in lst) {
//       if (removing) {
//         if (line.toLowerCase().startsWith("xpress bees") ||
//             line.toLowerCase().startsWith("shadowfax") ||
//             line.toLowerCase().startsWith("valmo")) {
//           removing = false;
//           filteredList.add(line);
//           break; // Add the line that stops the removal
//         }
//       } else {
//         if (calculateSimilarity(line, "If undelivered, return to:") >= 55) {
//           removing = true;
//         } else {
//           filteredList.add(line);
//         }
//       }
//     }

//     ///End busy state
//     setState(() {
//       _isBusy = false;
//     });
//   }
// }
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:string_similarity/string_similarity.dart';

// class RecognizeController extends GetxController {
//   var isBusy = false.obs;
//   var filteredList = <String>[].obs;

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

//       for (String line in lst) {
//         if (removing) {
//           if (line.toLowerCase().startsWith("xpress bees") ||
//               line.toLowerCase().startsWith("shadowfax") ||
//               line.toLowerCase().startsWith("valmo")) {
//             removing = false;
//             filteredList.add(line);
//           }
//         } else {
//           if (calculateSimilarity(line, "if undelivered") >= 0.55) {
//             removing = true;
//           } else {
//             filteredList.add(line);
//           }
//         }
//       }
//     } catch (e) {
//       log(e.toString());
//     } finally {
//       isBusy.value = false;
//       textRecognizer.close();
//     }
//   }
// }

// class RecognizePage extends StatelessWidget {
//   final String? path;
//   final RecognizeController controller = Get.put(RecognizeController());

//   RecognizePage({Key? key, this.path}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Recognized Page")),
//       body: GetBuilder<RecognizeController>(
//         builder: (controller) {
//           return controller.isBusy.value
//               ? Center(child: CircularProgressIndicator())
//               : Container(
//                   padding: const EdgeInsets.all(20),
//                   child: ListView.builder(
//                     itemCount: controller.filteredList.length,
//                     itemBuilder: (context, index) =>
//                         Text(controller.filteredList[index]),
//                   ),
//                 );
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           controller.processImage(path!);
//         },
//         label: const Text('Process Image'),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:string_similarity/string_similarity.dart';

class RecognizeController extends GetxController {
  var isBusy = false.obs;
  var filteredList = <String>[].obs;

  Future<void> processImage(String path) async {
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
      filteredList.clear(); // Clear the list before adding new items

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
    } catch (e) {
      log(e.toString());
    } finally {
      isBusy.value = false;
      textRecognizer.close();
    }
  }
}

class RecognizePage extends StatelessWidget {
  final String? path;
  final RecognizeController controller = Get.put(RecognizeController());

  RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recognized Page")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Obx(() => controller.isBusy.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: controller.filteredList.length,
                        itemBuilder: (context, index) => ListTile(
                            title: Text(controller.filteredList[index])),
                      )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.processImage(path!);
              },
              child: Text('Process Image'),
            ),
          ],
        ),
      ),
    );
  }
}
