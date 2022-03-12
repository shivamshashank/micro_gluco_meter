import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:micro_gluco_meter/widgets/custom_button.dart';

class RegionOfInterestScreen extends StatefulWidget {
  final RegionOfInterestArguments regionOfInterestArguments;

  const RegionOfInterestScreen({
    Key? key,
    required this.regionOfInterestArguments,
  }) : super(key: key);

  @override
  State<RegionOfInterestScreen> createState() => _RegionOfInterestScreenState();
}

class _RegionOfInterestScreenState extends State<RegionOfInterestScreen> {
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
              widget.regionOfInterestArguments.imageFile,
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
              widget.regionOfInterestArguments.imageFile,
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
        onPressed: () {},
      ),
    );
  }
}

class RegionOfInterestArguments {
  final File imageFile;

  RegionOfInterestArguments({required this.imageFile});
}
