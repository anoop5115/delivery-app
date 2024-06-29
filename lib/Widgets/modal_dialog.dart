import 'package:flutter/material.dart';

void imagePickerModal(BuildContext context,
    {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 220,
          child: Column(
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 92, 112, 202)),
                    child: const Text("Camera",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: onGalleryTap,
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 92, 112, 202)),
                    child: const Text("Gallery",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
