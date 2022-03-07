import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme_data.dart';

class GenderCard extends StatelessWidget {
  final IconData iconData;
  final String label;
  final double opacity;

  const GenderCard({
    Key? key,
    required this.iconData,
    required this.label,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: 0.08.sh,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appThemeData().primaryColor.withOpacity(opacity),
      ),
    );
  }
}
