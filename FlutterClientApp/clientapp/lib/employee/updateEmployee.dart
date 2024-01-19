import 'dart:convert';

import 'package:clientapp/alert/myAlertDialog.dart';
import 'package:clientapp/models/EmployeeModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateEmployee extends StatefulWidget {
  EmployeeModel employeeModel;

  TextEditingController? employeeNumber;
  bool? isEnabled = false;
  TextEditingController? firstController;
  TextEditingController? lastController;
  Future<EmployeeModel>? _employee;

  UpdateEmployee({super.key, required this.employeeModel});

  updateEmployeeState(EmployeeModel e) {
    employeeNumber =
        TextEditingController(text: this.employeeModel.id.toString());
    firstController = TextEditingController(text: this.employeeModel.firstName);
    lastController = TextEditingController(text: this.employeeModel.lastName);
  }

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

Future<EmployeeModel> updateEmployee(
    int id, EmployeeModel employee, BuildContext context) async {
  var Url = "http://localhost:8080/api/employee/" + employee.id.toString();

  try {
    var response = await http.put(Uri.parse(Url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(employee));

    var employeeUpdated = EmployeeModel(
        id: id, firstName: employee.firstName, lastName: employee.lastName);

    String responseString = response.body;
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogContext) {
            return MyAlertDialog(
              title: 'Backend response',
              content: responseString,
            );
          });
      return employeeUpdated;
    } else {
      throw Exception(
          'Failed to register employee. Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception("Failed to update employee. Error $error");
  }
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  final minPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update employee'),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(minPadding * 2),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: widget.employeeNumber,
                  enabled: widget.isEnabled,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Employee ID',
                      hintText: 'Enter employee ID',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: widget.firstController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: widget.employeeModel.firstName,
                      hintText: 'Enter first name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
                child: TextFormField(
                  style: textStyle,
                  controller: widget.lastController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: widget.employeeModel.lastName,
                      hintText: 'Enter last name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  String firstName = widget.firstController!.text;
                  String lastName = widget.lastController!.text;

                  EmployeeModel emp = EmployeeModel();
                  emp.id = widget.employeeModel.id;
                  emp.firstName = firstName;
                  emp.lastName = lastName;

                  EmployeeModel employeeUpdated =
                      await updateEmployee(emp.id!, emp, context);
                  setState(() {
                    widget.employeeModel = employeeUpdated;
                  });
                },
                child: Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
