import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:micro_gluco_meter/models/record_model.dart';
import 'package:micro_gluco_meter/widgets/app_theme_data.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key? key}) : super(key: key);

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            value,
            style: TextStyle(
              color: appThemeData().primaryColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<RecordModel> _recordsList = [];
    Hive.box("box").values.cast<RecordModel>().forEach(
          (element) => _recordsList.add(element),
        );

    return Scaffold(
      appBar: const CustomAppBar(appBarText: "Records"),
      body: _recordsList.isEmpty
          ? const Center(
              child: Text(
                "No Records",
                style: TextStyle(fontSize: 32),
              ),
            )
          : ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _recordsList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: appThemeData().primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      _textWidget(
                        'Name',
                        _recordsList[index].name,
                      ),
                      _textWidget(
                        'Gender',
                        _recordsList[index].gender,
                      ),
                      _textWidget(
                        'Age',
                        _recordsList[index].age,
                      ),
                      _textWidget(
                        'PhoneNumber',
                        _recordsList[index].phoneNumber,
                      ),
                      _textWidget(
                        'Concentration',
                        _recordsList[index].concentration,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
