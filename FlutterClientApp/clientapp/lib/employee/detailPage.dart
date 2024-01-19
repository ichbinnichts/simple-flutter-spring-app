import 'package:clientapp/employee/updateEmployee.dart';
import 'package:clientapp/models/EmployeeModel.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  EmployeeModel employee;

  DetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    goToUpdateEmployee(EmployeeModel e) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => UpdateEmployee(
          employeeModel: e,
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.employee.firstName!),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(this.employee.firstName! + ' ' + this.employee.lastName!),
          OutlinedButton(
              onPressed: () async {
                goToUpdateEmployee(employee);
              },
              child: Text('Update employee'))
        ],
      ),
    );
  }
}
