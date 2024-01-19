import 'dart:convert';
import 'dart:html';

import 'package:clientapp/alert/myAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:clientapp/models/employeeModel.dart';
import 'package:http/http.dart' as http;

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
}

Future<EmployeeModel> registerEmployee(
    String firstName, lastName, BuildContext context) async {
  var Url = "http://localhost:8080/api/employee";

  try {
    var response = await http.post(Uri.parse(Url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(
            <String, String>{"firstName": firstName, "lastName": lastName}));

    if (response.statusCode == 200) {
      // Assuming the response contains information about the registered employee
      var jsonResponse = jsonDecode(response.body);

      var employee = EmployeeModel(
        id: jsonResponse['id'],
        firstName: jsonResponse['firstName'],
        lastName: jsonResponse['lastName'],
      );

      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: 'Backend response', content: response.body);
        },
      );

      return employee;
    } else {
      throw Exception(
          'Failed to register employee. Status code: ${response.statusCode}');
    }
  } catch (error) {
    throw Exception('Failed to register employee. Error: $error');
  }
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final minPadding = 5.0;

  void _submitBtn() {}

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register employee'),
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
                  controller: firstController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'First name',
                      hintText: 'Enter your first name',
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
                  controller: lastController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter your name";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Last name',
                      hintText: 'Enter your last name',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: _submitBtn,
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
