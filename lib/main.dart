// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:job_age_calculator/core/my_colors.dart';
import 'package:job_age_calculator/widgets/manual_date_input.dart';
import 'package:job_age_calculator/widgets/my_app_bar.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateDuration? duration;

  final _formKey = GlobalKey<FormState>();

  TextEditingController dayController = TextEditingController();

  TextEditingController monthController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const MyAppBar(),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColors.secondaryColor,
                    ),
                    height: 150,
                    width: double.infinity,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "চাকরীর আবেদনের ক্ষেত্রে, বা বিভিন্ন কর্মসংস্থানে জবের ক্ষেত্রে, আমাদের বিভিন্ন সময় বয়স হিসাব করতে হয় অনেকেরেই এটার জন্য,ঝামেলা পোহাতে হয়, কিন্তু এই অ্যাপের মাধ্যমে, আপনারা সহজেই, নিখুত ভাবে চাকরীর বয়স বের করতে পারবেন । ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 60,
                    width: double.infinity,
                    color: MyColors.secondaryColor,
                    child: const Text(
                      "সার্কুলারে থাকা তারিখ দিন",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                ManualDateInput(
                    dayInputController: dayController,
                    monthInputController: monthController,
                    yearInputController: yearController),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyColors.secondaryColor)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                      DateTime joiningDate = DateTime(
                          int.parse(yearController.text),
                          int.parse(monthController.text),
                          int.parse(dayController.text));
                      DateTime now = DateTime.now();
                      print("current date: $now");

                      setState(() {
                        duration = AgeCalculator.age(joiningDate);
                        print(duration);
                      });

                      //duration.years;
                      //duration.months;
                      //duration!.days;
                    },
                    child: const Text(
                      "বয়স দেখুন",
                      style: TextStyle(fontSize: 21, color: Colors.black),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    color: MyColors.secondaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: MyColors.primaryColor,
                        height: 80,
                        width: double.infinity,
                        child: const Center(
                            child: Text(
                          "আপনার বর্তমান মোট চাকরীর বয়স",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    color: MyColors.secondaryColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 50,
                                width: 142,
                                color: MyColors.primaryColor,
                                child: Center(
                                  child: Text(
                                    "মোট মাসঃ ${duration?.months ?? "Waiting"} ",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                height: 50,
                                width: 142,
                                color: MyColors.primaryColor,
                                child: Center(
                                  child: Text(
                                    "মোট বছরঃ ${duration?.years ?? "waiting"} ",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 142,
                              color: MyColors.primaryColor,
                              child: Center(
                                child: Text(
                                  "মোট দিনঃ ${duration?.days ?? "Waiting"}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrl(Uri.parse("https://t.me/jobcontainer"));
                  },
                  icon: const Icon(
                    FontAwesomeIcons.telegram,
                    color: Colors.blue,
                  ),
                  iconSize: 45,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Center(
                  child: Text("Join Our Telegram Group"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
