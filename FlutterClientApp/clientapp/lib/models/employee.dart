import 'dart:convert';

Employee employeeJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  int id;
  String firstName;
  String lastName;

  Employee({required this.id, required this.firstName, required this.lastName});

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
      firstName: json["firstName"], lastName: json["lastName"], id: json["id"]);

  Map<String, dynamic> toJson() =>
      {"firstName": firstName, "lastName": lastName, "id": id};

  String get _firstName => firstName;

  String get _lastName => lastName;
}
