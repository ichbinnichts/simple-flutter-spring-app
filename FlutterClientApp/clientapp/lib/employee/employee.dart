import 'package:clientapp/app.dart';
import 'package:flutter/material.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  _addEmployee() {}

  _iconSearch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: _iconSearch,
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEmployee,
        child: Icon(Icons.add),
        tooltip: 'Add employee',
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(),
        ),
      ),
    );
  }
}
