import 'package:clientapp/employee/employee.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _iconButton() {
    print('Icon button');
  }

  void _iconSearch() {}

  void _iconGoToEmployees() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const Employee(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: '',
          color: Colors.white,
          onPressed: _iconButton,
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Employee Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to Employee management App!',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _iconGoToEmployees,
        tooltip: 'Go to Employee list',
        child: const Icon(Icons.arrow_right),
      ),
    );
  }
}
