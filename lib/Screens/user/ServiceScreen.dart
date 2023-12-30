import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:break_down_assistance/widgets/customTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Rating.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final amount = TextEditingController();
  List<String> droplist = ["Fuel leaking", "Engin work", "Tyre alignment"];
  List<String> droplist2 = []; // drop down button list...........................
  String? selectedvalue; // drop down selected value..........................
  final place = TextEditingController();

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
            text: "Needed service",
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
                text: "contact number",
                weight: FontWeight.w400,
                size: 14,
                textcolor: customBalck),
            SizedBox(
              height: 5.h,
            ),
            const AppText(
                text: "2+ year experience",
                weight: FontWeight.w400,
                size: 14,
                textcolor: customBalck),
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
            const Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                    text: "Add needed service",
                    weight: FontWeight.w400,
                    size: 16,
                    textcolor: customBalck)),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Flexible(
                  child: Card(
                    color: lightBlue,
                    child: DropdownButton<String>(
                        isExpanded: true,
                        elevation: 0,
                        dropdownColor: lightBlue,
                        hint: const Text("Issue"),
                        underline: const SizedBox(),
                        value: selectedvalue,
                        items: droplist.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selectedvalue = newvalue;
                          });
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  mini: true,
                  backgroundColor: customBalck,
                  child: const Icon(
                    Icons.add,
                    color: white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              color: lightBlue,
              child: DropdownButton<String>(
                  isExpanded: true,
                  elevation: 0,
                  dropdownColor: lightBlue,
                  hint: const Text("Issue"),
                  underline: const SizedBox(),
                  value: selectedvalue,
                  items: droplist2.map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (newvalue) {
                    setState(() {
                      selectedvalue = newvalue;
                    });
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 10)),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: const AppText(
                      text: "Place",
                      weight: FontWeight.w400,
                      size: 16,
                      textcolor: customBalck),
                )),
            CustomTextField(
                hint: "place",
                fillcolor: lightBlue,
                controller: place,
                validator: (value) {}),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 70).r,
              child: CustomButton(
                  btnname: "Request",
                  btntheam: customBlue,
                  textcolor: white,
                  click: () {
                    //Request Function..........
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
