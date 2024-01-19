import 'dart:convert';

EmployeeModel employeeJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));

String employeeToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  int id;
  String firstName;
  String lastName;

  EmployeeModel(
      {required this.id, required this.firstName, required this.lastName});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
      firstName: json["firstName"], lastName: json["lastName"], id: json["id"]);

  Map<String, dynamic> toJson() =>
      {"firstName": firstName, "lastName": lastName, "id": id};

  String get _firstName => firstName;

  String get _lastName => lastName;
}
