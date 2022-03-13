import 'package:flutter/material.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';

class GraphsScreen extends StatelessWidget {
  const GraphsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        appBarText: "Graphs",
      ),
    );
  }
}
