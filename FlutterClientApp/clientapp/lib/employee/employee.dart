import 'package:clientapp/app.dart';
import 'package:flutter/material.dart';
import 'registerEmployee.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
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
    );
  }
}
