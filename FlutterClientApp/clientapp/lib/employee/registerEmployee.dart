import 'package:flutter/material.dart';

class RegisterEmployee extends StatefulWidget {
  const RegisterEmployee({super.key});

  @override
  State<RegisterEmployee> createState() => _RegisterEmployeeState();
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
