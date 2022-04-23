import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_gluco_meter/models/record_model.dart';
import 'package:micro_gluco_meter/models/user_model.dart';
import 'package:micro_gluco_meter/providers/user_provider.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportsScreen extends StatelessWidget {
  final ReportsArguments reportsArguments;

  const ReportsScreen({
    Key? key,
    required this.reportsArguments,
  }) : super(key: key);

  final String _concentration = "343.12 mm of Hg";

  @override
  Widget build(BuildContext context) {
    UserModel _user = context.read<UserProvider>().user!;

    SharedPreferences.getInstance().then(
      (preferences) {
        List<String> _previousRecords =
            preferences.getStringList("records") ?? [];
        _previousRecords.add(
          jsonEncode(
            RecordModel(
              name: _user.name,
              gender: _user.gender,
              age: _user.age,
              phoneNumber: _user.phoneNumber,
              concentration: _concentration,
            ).toJson(),
          ),
        );
        preferences.setStringList('records', _previousRecords);
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        appBarText: "Reports",
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.registerScreen,
              (route) => false,
            ),
            icon: const Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              initialValue: _user.name,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              initialValue: _user.gender,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                labelText: 'Gender',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              initialValue: _user.age,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                labelText: 'Age',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              initialValue: _user.phoneNumber,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                labelText: 'Phone Number',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              initialValue: _concentration,
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                labelText: 'Concentration',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.file(
              reportsArguments.imageFile,
              width: double.infinity,
              height: 0.3.sh,
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            "Region Of Interest",
            style: TextStyle(
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () => Navigator.pushNamed(
          context,
          Routes.graphsScreen,
        ),
        child: Icon(
          Icons.bar_chart,
          size: 32.sp,
        ),
      ),
    );
  }
}

class ReportsArguments {
  final File imageFile;

  ReportsArguments({required this.imageFile});
}
