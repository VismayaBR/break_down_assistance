import 'package:break_down_assistance/Screens/user/MechanicBill.dart';
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
    required this.status,
    required this.amount, 
    required this.r_id,
  });

  final String name;
  final String date;
  final String time;
  final String issue;
  final String status;
  final String amount;
  final String r_id;

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
          if (status == '0')
            SizedBox(
              width: 150.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Container(
                    height: 30,
                    width: 110.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.orange),
                    child: const Center(
                      child: AppText(
                          text: "Pending",
                          weight: FontWeight.w400,
                          size: 14,
                          textcolor: white),
                    )),
              ),
            ),
          if (status == '1')
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
            ),
          if (status == '2')
            SizedBox(
              width: 150.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Container(
                    height: 30,
                    width: 110.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red),
                    child: const Center(
                      child: AppText(
                          text: "Rejected",
                          weight: FontWeight.w400,
                          size: 14,
                          textcolor: white),
                    )),
              ),
            ),
          if (status == '3')
            SizedBox(
              width: 150.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: InkWell(
                  onTap: () {
                    print("Widget Amount: ${amount}");
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return MechanicBill(amt: amount,r_id:r_id);
                    }));
                  },
                  child: Container(
                      height: 30,
                      width: 110.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 11, 110, 14)),
                      child: const Center(
                        child: AppText(
                            text: "Pay",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: white),
                      )),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
