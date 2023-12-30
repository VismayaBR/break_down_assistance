import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Rating.dart';

class MechanicBill extends StatelessWidget {
  MechanicBill({super.key});

  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlue,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
        title: const AppText(
            text: "Mechanic Bill",
            weight: FontWeight.w400,
            size: 20,
            textcolor: customBalck),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 45, right: 45, top: 10, bottom: 20).r,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              "assets/men3.png",
              width: 150.w,
              height: 150.h,
              fit: BoxFit.fill,
            ),
            const AppText(
                text: "Name",
                weight: FontWeight.w400,
                size: 16,
                textcolor: customBalck),
            SizedBox(
              height: 15.h,
            ),
            const AppText(
                text: "2+ year experience",
                weight: FontWeight.w400,
                size: 14,
                textcolor: customBalck),
            SizedBox(
              height: 10.h,
            ),
            Card(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                child: const AppText(
                    text: "Available",
                    weight: FontWeight.w400,
                    size: 12,
                    textcolor: white),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25,
                  unratedColor: Colors.yellow[100],
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RatingScreen(),
                        ));
                  },
                  child: const Icon(
                    Icons.edit,
                    color: customBalck,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                  text: "Amount",
                  weight: FontWeight.w400,
                  size: 20,
                  textcolor: customBalck),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: SizedBox(
                  height: 43.h,
                  child: TextFormField(
                    controller: amount,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.currency_rupee),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: customBalck),
                            borderRadius: BorderRadius.circular(12).r),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: customBalck),
                            borderRadius: BorderRadius.circular(12).r)),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 70).r,
              child: CustomButton(
                  btnname: "Payment",
                  btntheam: customBlue,
                  textcolor: white,
                  click: () {}),
            )
          ]),
        ),
      ),
    );
  }
}
