# resume_builder_ui

This the frontend for the adobe_resume_generator api which is the main project for evaluation. If you are here before visiting that project head to this url [https://github.com/aashish2604/adobe_resume_builder](https://github.com/aashish2604/adobe_resume_builder).\
All the frontend components are hosted and their links are provided in document of the backend api. But still if you want to test this locally you can do so.
**NOTE** In order to test this locally you need to have the latest version of flutter installed in your system. Follow the section below to get started with flutter in your system

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Testing

If the following command runs in your terminal and is not giving any errors then you can follow along.
```dart
flutter doctor
```

After cloning this repo just select you service and hit run. Thats it. This will automatically build the debug version of the project for that particular platform and you would be able to test the app locally

## File Structure

Every logic and code involved with the functionality is added in the lib folder where the models consists of dart objects for JSON response. The add uses ***Riverpod*** for state-management and the providers related to it are added in the provider folder. The repository contains the code for making and handling the api call. The screens consists of dart files each representing a single page of the app. The services contains some code snippets which is shared in the entire application. The widget folder contains the widgets which forms the UI components of different screens. Finally the main.dart file is the files which is executed for starting the app. It is also worth noting that the pubspec.yaml contains all the dependencies and the local assets declaration involved in the app

## What to expect from the frontend

The frontend of all the three platforms have the following flow of pages:
* **1st page** - It will give you the option to choose one of the 3 resume templates. You will also be able to preview each of them before proceeding.
* **2nd page** - It will contain a set of 5 seperate forms:
    * *Personal Details*
    * *Education Details*
    * *Experience Details*
    * *Acheivements Details*
    * *Other Details*

    **NOTE:** The data of each of the details follows the guidelines of the request body JSON defined in first section (Overview of backend) of this document.
* **3rd page** - It will show a loading indicator while the request is processing. Upon receiving the response it will save the file appropriately according to the platform used.

To test the website follow the link to the [website](https://aashish2604.github.io/resume_builder_web/#/)

To test the mobile app download the **apk** from this [link](https://drive.google.com/file/d/1N3-uF3D2G8CcPz2snUu1s8tw2Bu8VYMN/view?usp=sharing) and run it in your device


To test the windows app download the **.exe** setup from this [link](https://drive.google.com/file/d/1JvqFr-mEbRV1hcbD3CvNA8x1LYpfbz3c/view?usp=sharing) and run it on your Windows machine

While using any of the 3 frontends whenever you wish to add a url you could do so by clicking the button at the end of each TextField. One important thing to note here is that the enter url be shown in the field along with its anchor text like: https://google.com[google].

