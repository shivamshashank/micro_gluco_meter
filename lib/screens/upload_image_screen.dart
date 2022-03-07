import 'package:flutter/material.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarText: "Upload Image"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [],
      ),
    );
  }
}
