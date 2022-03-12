import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:micro_gluco_meter/screens/region_of_interest_screen.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/app_theme_data.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:micro_gluco_meter/widgets/custom_button.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  late File imageFile;

  /// Get image
  _getImage(String imageSelectionMode) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: imageSelectionMode == "camera"
          ? ImageSource.camera
          : ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
      Navigator.pushNamed(
        context,
        Routes.regionOfInterestScreen,
        arguments: RegionOfInterestArguments(imageFile: imageFile),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarText: "Upload Image"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera),
                  SizedBox(width: 0.05.sw),
                  const Text(
                    "Capture Image",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              onPressed: () => _getImage("camera"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.2.sw),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: appThemeData().dividerColor,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      "OR",
                      style: TextStyle(color: appThemeData().dividerColor),
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  Expanded(
                    child: Divider(
                      color: appThemeData().dividerColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.folder),
                  SizedBox(width: 0.05.sw),
                  const Text(
                    "Browse Image",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              onPressed: () => _getImage("gallery"),
            ),
          ],
        ),
      ),
    );
  }
}
