import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    required this.name,
    required this.date,
    required this.amount,
    required this.service,
    required this.mechanic_name,
  });

  final String name;
  final String date;
  final String amount;
  final String service;
  final String mechanic_name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 125.h,
        width: double.infinity,
        color: white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10).r,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                        text: name,
                        weight: FontWeight.w500,
                        size: 14,
                        textcolor: customBalck),
                    AppText(
                        text: date,
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck),
                  ],
                ),
                AppText(
                    text: "₹ ${amount}/-",
                    weight: FontWeight.w500,
                    size: 14,
                    textcolor: customBalck),
                AppText(
                    text: service,
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck),
                AppText(
                    text: mechanic_name,
                    weight: FontWeight.w400,
                    size: 14,
                    textcolor: customBalck),
              ]),
        ),
      ),
    );
  }
}
