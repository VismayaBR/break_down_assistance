import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AcceptScreen.dart';
import 'RejectScreen.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            padding: const EdgeInsets.only(left: 30, right: 30).r,
            child: Center(
              child: Container(
                height: 500.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15).r,
                    color: maincolor),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, top: 25).r,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                            text: "Name",
                            weight: FontWeight.w400,
                            size: 14,
                            textcolor: customBalck),
                        Row(
                          children: [
                            Expanded(
                                child: SizedBox(
                              height: 400.h,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                        top: 60, bottom: 50, right: 5)
                                    .r,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const AppText(
                                          text: "Problem",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: "Place",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: "Date",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: "Time",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: "Contact number",
                                          weight: FontWeight.w400,
                                          size: 14,
                                          textcolor: customBalck),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                                top: 50, right: 10)
                                            .r,
                                        child: CustomButton(
                                            btnname: "Accept",
                                            textsize: 15,
                                            height: 40,
                                            btntheam: Colors.green,
                                            textcolor: white,
                                            click: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AcceptScreen()));
                                            }),
                                      )
                                    ]),
                              ),
                            )),
                            Expanded(
                                child: SizedBox(
                              height: 400.h,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, bottom: 50)
                                        .r,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const AppText(
                                          text: ": Fuel leaking ",
                                          weight: FontWeight.w500,
                                          size: 14,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: ": Kozhikode beach road",
                                          weight: FontWeight.w400,
                                          size: 12,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: ": 12/05/2023",
                                          weight: FontWeight.w400,
                                          size: 12,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: ": 10:00 am",
                                          weight: FontWeight.w400,
                                          size: 12,
                                          textcolor: customBalck),
                                      const AppText(
                                          text: ": 00000000",
                                          weight: FontWeight.w400,
                                          size: 12,
                                          textcolor: customBalck),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                                left: 10, top: 50)
                                            .r,
                                        child: CustomButton(
                                            btnname: "Reject",
                                            height: 40,
                                            textsize: 15,
                                            btntheam: Colors.red,
                                            textcolor: white,
                                            click: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RejectScreen(),
                                                  )); // reject..............
                                            }),
                                      )
                                    ]),
                              ),
                            )),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 170).r,
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage("assets/men2.png"),
              ),
            ))
      ],
    );
  }
}
