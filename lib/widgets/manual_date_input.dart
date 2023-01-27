// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_age_calculator/core/my_colors.dart';

class ManualDateInput extends StatelessWidget {
  TextEditingController dayInputController;
  TextEditingController monthInputController;
  TextEditingController yearInputController;
  ManualDateInput({
    Key? key,
    required this.dayInputController,
    required this.monthInputController,
    required this.yearInputController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: const EdgeInsets.all(6),
        height: 70,
        width: double.infinity,
        color: MyColors.secondaryColor,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(2),
                color: MyColors.primaryColor,
                child: TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "can't be empty";
                    }
                    if (value.isEmpty) {
                      return "can't be empty";
                    }
                    if (value.length > 2) {
                      return "Exited 2 numbers";
                    }
                    if (int.parse(value) > 31) {
                      return "Exited 31";
                    }
                    return null;
                  },
                  controller: dayInputController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "দিন"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  color: MyColors.primaryColor,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "can't be empty";
                      }
                      if (value.isEmpty) {
                        return "can't be empty";
                      }
                      if (value.length > 2) {
                        return "Crossed 2 numbers";
                      }
                      if (int.parse(value) > 12) {
                        return "Crossed 12";
                      }
                      return null;
                    },
                    controller: monthInputController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "মাস"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Container(
                  color: MyColors.primaryColor,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return "can't be empty";
                      }
                      if (value.isEmpty) {
                        return "can't be empty";
                      }
                      if (value.length > 4) {
                        return "crossed 4 Character";
                      }
                      if (int.parse(value) < 1950) {
                        return "Bellow 1950 ! ";
                      }
                      return null;
                    },
                    controller: yearInputController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "বছর"),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 5.0),
            //   child: Container(
            //     height: 60,
            //     width: 140,
            //     color: MyColors.primaryColor,
            //     child: const JoiningDateInput(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
