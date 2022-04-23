class RecordModel {
  RecordModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.phoneNumber,
    required this.concentration,
  });

  String name;
  String gender;
  String age;
  String phoneNumber;
  String concentration;

  factory RecordModel.fromJson(Map<String, dynamic> json) => RecordModel(
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        phoneNumber: json["phoneNumber"],
        concentration: json['concentration'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gender": gender,
        "age": age,
        'phoneNumber': phoneNumber,
        "concentration": concentration,
      };
}
