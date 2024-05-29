# PanopticAI

PanopticAI is an iOS application that utilises the MobileNetV2 CoreML model and Apple's Vision framework to identify objects in images taken with the phone camera. Once an image is classified, the app fetches and displays a Wikipedia extract related to the identified object.

## Features

- **Image Classification**: Uses MobileNetV2 CoreML model for accurate image classification.
- **Vision Framework**: Leverages Apple's Vision framework for image analysis.
- **Wikipedia Integration**: Fetches and displays a summary from Wikipedia for the classified image.
- **User-friendly Interface**: Simple and intuitive UI for capturing and analyzing images.
- **Real-time Processing**: Processes images in real-time for quick results.

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.0+

## Installation

1. Clone or download the repository.
2. Open the project in Xcode.
3. Ensure you have an active internet connection for fetching Wikipedia extracts.
4. Build and run the project on a physical device.

## Usage

1. Launch the PanopticAI app on your iOS device.
2. Allow the app to access your camera when prompted.
3. Capture an image using the camera button.
4. The app will analyse the image and classify it using the MobileNetV2 model.
5. Once classified, the app will fetch and display a relevant extract from Wikipedia about the identified object.

## CoreML Model

PanopticAI uses the MobileNetV2 model for image classification. The model is pre-trained to recognise a wide variety of objects.

## API Integration

The app integrates with Wikipedia to fetch extracts related to the identified objects. Make sure your device has internet access to retrieve this information.
