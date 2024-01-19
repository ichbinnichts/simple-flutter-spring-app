import 'dart:convert';

import 'package:clientapp/app.dart';
import 'package:flutter/material.dart';
import 'registerEmployee.dart';
import 'package:http/http.dart' as http;
import 'package:clientapp/models/EmployeeModel.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  Future<List<EmployeeModel>> fetchEmployees() async {
    var Url = "http://localhost:8080/api/employee";

    try {
      var response = await http.get(Uri.parse(Url));

      if (response.statusCode == 200) {
        // Assuming the response contains a list of employee objects
        List<dynamic> jsonList = jsonDecode(response.body);

        // Create a list of Employee instances
        List<EmployeeModel> employeeList = jsonList
            .map((json) => EmployeeModel(
                  id: json['id'],
                  firstName: json['firstName'],
                  lastName: json['lastName'],
                ))
            .toList();

        return employeeList;
      } else {
        throw Exception(
            'Failed to fetch employees. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch employees. Error: $error');
    }
  }

  _gotToAddEmployee() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const RegisterEmployee(),
    ));
  }

  _iconSearch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee list'),
        actions: <Widget>[
          IconButton(
            onPressed: _iconSearch,
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotToAddEmployee,
        child: Icon(Icons.add),
        tooltip: 'Add employee',
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchEmployees(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: Icon(Icons.error)),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Name'),
                    subtitle: Text('${snapshot.data[index].firstName}' +
                        ' ' +
                        '${snapshot.data[index].lastName}'),
                    onTap: () {},
                  );
                });
          },
        ),
      ),
    );
  }
}
