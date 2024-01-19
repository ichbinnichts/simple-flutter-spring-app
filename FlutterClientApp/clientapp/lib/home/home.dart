import 'package:clientapp/employee/employee.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final minPadding = 5.0;

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Employee Management',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Employee management App!',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minPadding, bottom: minPadding),
          children: const <Widget>[
            DrawerHeader(
              child: Text('Employee Management'),
            ),
          ],
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
