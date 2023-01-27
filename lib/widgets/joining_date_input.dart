// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';

class JoiningDateInput extends StatefulWidget {
  const JoiningDateInput({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<JoiningDateInput> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DateTimeField(
        mode: DateTimeFieldPickerMode.date,
        decoration: const InputDecoration(
          icon: Icon(
            Icons.calendar_month,
            color: Colors.blue,
            size: 25,
          ),
        ),
        selectedDate: selectedDate,
        onDateSelected: (DateTime value) {
          setState(
            () {
              selectedDate = value;
              print(value);
            },
          );
        },
      ),
    );
  }
}
