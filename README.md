# Delivery Route Optimizer App

This Flutter project helps delivery personnel efficiently deliver products by ensuring that they don't visit the same location more than once. The app uses Optical Character Recognition (OCR) to extract details from the slip on a courier packet, such as the address, pincode, and mobile number. It then organizes and sorts the delivery details based on location and pincode, making it easier to plan an optimal delivery route.

## Video Demo

Click on the image below to watch a demo video of the app:

[![Watch the video](https://img.youtube.com/vi/IDphjIBZ5iU/maxresdefault.jpg)](https://youtube.com/shorts/IDphjIBZ5iU?si=XwGiZW_1yhzG6kVV)

## Features

- **OCR Integration**: Capture and extract text from delivery slips.
- **Address and Pincode Extraction**: Automatically detects key information like address, pincode, and contact numbers.
- **Sorting & Filtering**: Sort delivery tasks based on location and pincode to optimize the route.
- **Search Functionality**: Allows quick search by pincode or address to assist with navigation.

## Getting Started

Follow these instructions to run the Flutter project on your local machine.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/) with Flutter and Dart extensions.
- A device or emulator running Android/iOS.

### Installation Steps

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/delivery-route-optimizer.git
   cd delivery-route-optimizer