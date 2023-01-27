import 'package:flutter/material.dart';
import 'package:job_age_calculator/core/my_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(1),
            blurRadius: 20.0,
          ),
        ],
      ),
      height: 60,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Job Age Calculator",
            style: TextStyle(fontSize: 30.0),
          ),
          InkWell(
            onTap: () {},
            child: const CircleAvatar(
              radius: 15.0,
              backgroundColor: MyColors.primaryColor,
              backgroundImage: AssetImage(
                "assets/info_icon.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}
