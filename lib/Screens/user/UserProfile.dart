import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:break_down_assistance/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  var name = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    name.text = spref.getString('name') ?? '';
    phone.text = spref.getString('phone') ?? '';
    email.text = spref.getString('email') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35).r,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  SizedBox(height: 100.h),
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const AssetImage("assets/admin.png"),
                  ),
                  SizedBox(height: 10.h),
                  const AppText(
                    text: "Name",
                    weight: FontWeight.w500,
                    size: 10,
                    textcolor: Colors.black,
                  ),
                  SizedBox(height: 50.h),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Enter your Name",
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: Colors.black,
                    ),
                  ),
                  CustomTextField(
                    hint: "Name",
                    fillcolor: maincolor,
                    controller: name,
                    validator: (value) {},
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Enter your phone number",
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: Colors.black,
                    ),
                  ),
                  CustomTextField(
                    hint: "phone number",
                    fillcolor: maincolor,
                    controller: phone,
                    validator: (value) {},
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "Enter your email",
                      weight: FontWeight.w400,
                      size: 14,
                      textcolor: Colors.black,
                    ),
                  ),
                  CustomTextField(
                    hint: "email",
                    fillcolor: maincolor,
                    controller: email,
                    validator: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 150).r,
                    child: CustomButton(
                      btnname: "Done",
                      btntheam: customBlue,
                      textcolor: white,
                      click: () {},
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
