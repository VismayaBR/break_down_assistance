import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:break_down_assistance/widgets/requestTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({super.key});

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}

int selectedOption = 1;
final amount = TextEditingController();

class _AcceptScreenState extends State<AcceptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
        padding: const EdgeInsets.only(left: 20).r,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: SingleChildScrollView(
          child: Column(children: [
             RequestTile(
                image: "assets/men2.png",
                name: "name",
                issue: "Fuel leaking",
                date: "date",
                time: "time",
                place: 'place',
            click: (){}),
            SizedBox(
              height: 80.h,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                  text: "Add status",
                  weight: FontWeight.w400,
                  size: 20,
                  textcolor: customBalck),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                    activeColor: customBlue,
                  ),
                  const AppText(
                      text: "Completed",
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: customBalck)
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                    activeColor: customBlue,
                  ),
                  const AppText(
                      text: "Not Completed",
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: customBalck)
                ],
              ),
            ]),
            SizedBox(
              height: 50.h,
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
                    keyboardType: TextInputType.number,
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
              padding: const EdgeInsets.only(left: 50, right: 50, top: 80).r,
              child: CustomButton(
                  btnname: "Submit",
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
