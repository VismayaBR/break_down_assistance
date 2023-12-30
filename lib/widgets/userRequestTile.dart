import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class UserRequestTile extends StatelessWidget {
  const UserRequestTile({
    super.key,
    required this.name,
    required this.date,
    required this.time,
    required this.issue,
  });

  final String name;
  final String date;
  final String time;
  final String issue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15).r,
      child: Container(
        height: 122.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r, color: lightBlue),
        child: Row(children: [
          Expanded(
              child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20).r,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                        text: name,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck),
                    AppText(
                        text: date,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck),
                    AppText(
                        text: time,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck),
                    AppText(
                        text: issue,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck)
                  ]),
            ),
          )),
          SizedBox(
            width: 150.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Container(
                  height: 30,
                  width: 110.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green),
                  child: const Center(
                    child: AppText(
                        text: "Approved",
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: white),
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
