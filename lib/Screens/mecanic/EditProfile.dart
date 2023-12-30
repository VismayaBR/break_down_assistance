import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/apptext.dart';
import '../../widgets/customTextfield.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final username = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final experience = TextEditingController();
  final workshop = TextEditingController();
  final location = TextEditingController();

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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/men.png",
                  ),
                ),
            Padding(
              padding: const EdgeInsets.only(top: 30).r,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: AppText(
                    text: "Enter Username",
                    weight: FontWeight.w500,
                    size: 16.sp,
                    textcolor: customBalck),
              ),
            ),
            CustomTextField(
                hint: "Enter Username",
                fillcolor: lightBlue,
                controller: username,
                validator: (value) {}),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter Phone number",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter Phone number",
                fillcolor: lightBlue,
                controller: phone,
                kebordtype: TextInputType.number,
                validator: (value) {}),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your email",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your email",
                fillcolor: lightBlue,
                controller: email,
                kebordtype: TextInputType.emailAddress,
                validator: (value) {}),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your work experience",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your work experience",
                fillcolor: lightBlue,
                controller: experience,
                validator: (value) {}),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your work shop name",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your work shop name",
                fillcolor: lightBlue,
                controller: workshop,
                validator: (value) {}),
            Align(
              alignment: Alignment.bottomLeft,
              child: AppText(
                  text: "Enter your location",
                  weight: FontWeight.w500,
                  size: 16.sp,
                  textcolor: customBalck),
            ),
            CustomTextField(
                hint: "Enter your location",
                fillcolor: lightBlue,
                controller: location,
                validator: (value) {}),
            Padding(
              padding: const EdgeInsets.only(
                      top: 30, left: 40, right: 40, bottom: 50)
                  .r,
              child: CustomButton(
                  btnname: "Sumbit",
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
