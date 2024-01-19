import 'package:clientapp/models/EmployeeModel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  EmployeeModel employee;

  DetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(employee.firstName),
      ),
    );
  }
}
