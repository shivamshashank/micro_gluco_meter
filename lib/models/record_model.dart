import 'package:hive/hive.dart';

part 'record_model.g.dart';

@HiveType(typeId: 1)
class RecordModel {
  RecordModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.concentration,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String gender;

  @HiveField(2)
  String age;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String concentration;
}
