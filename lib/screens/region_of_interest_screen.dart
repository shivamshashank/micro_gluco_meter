import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_gluco_meter/screens/reports_screen.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:micro_gluco_meter/widgets/custom_button.dart';

class RegionOfInterestScreen extends StatelessWidget {
  final RegionOfInterestArguments regionOfInterestArguments;

  const RegionOfInterestScreen({
    Key? key,
    required this.regionOfInterestArguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarText: "Region Of Interest",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              regionOfInterestArguments.imageFile,
              width: double.infinity,
              height: 0.3.sh,
              fit: BoxFit.cover,
            ),
            const Text(
              "Original Image",
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 0.05.sh),
            Image.file(
              regionOfInterestArguments.imageFile,
              width: double.infinity,
              height: 0.3.sh,
              fit: BoxFit.cover,
            ),
            const Text(
              "Region Of Interest",
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        child: const Text(
          "CONFIRM",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.reportsScreen,
          (route) => false,
          arguments: ReportsArguments(
            imageFile: regionOfInterestArguments.imageFile,
          ),
        ),
      ),
    );
  }
}

class RegionOfInterestArguments {
  final File imageFile;

  RegionOfInterestArguments({required this.imageFile});
}
