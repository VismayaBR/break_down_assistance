import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class AcceptTile extends StatelessWidget {
  const AcceptTile({
    super.key,
    required this.image,
    required this.name,
    required this.issue,
    required this.date,
    required this.time,
    required this.place,
    required this.status,
  });

  final String image;
  final String name;
  final String issue;
  final String date;
  final String time;
  final String place;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 120.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).r, color: maincolor),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10).r,
          child: Row(children: [
            SizedBox(
              width: 90.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.fill,
                  ),
                  AppText(
                      text: name,
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: customBalck),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          text: issue,
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
                          text: place,
                          weight: FontWeight.w400,
                          size: 14,
                          textcolor: customBalck),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40.h,
              width: 130.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12).r,
                  color: status == true ? Colors.green : Colors.red),
              child: Center(
                  child: AppText(
                      text: status == true
                          ? "Payment success"
                          : "Payment pending",
                      weight: FontWeight.w400,
                      size: 12,
                      textcolor: white)),
            )
          ]),
        ),
      ),
    );
  }
}
