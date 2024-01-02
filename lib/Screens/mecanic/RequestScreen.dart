import 'package:break_down_assistance/Screens/mecanic/MechHome.dart';
import 'package:break_down_assistance/constants/color.dart';
import 'package:break_down_assistance/widgets/apptext.dart';
import 'package:break_down_assistance/widgets/customButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'AcceptScreen.dart';
import 'RejectScreen.dart';

class RequestScreen extends StatefulWidget {
  String req_id;
  String name;
  String issue;
  String place;
  String date;
  String time;
  String status;

  RequestScreen({
    super.key,
    required this.req_id,
    required this.name,
    required this.issue,
    required this.place,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30).r,
            child: Center(
              child: Container(
                height: 500.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15).r,
                  color: maincolor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 25).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        text: "Name",
                        weight: FontWeight.w400,
                        size: 14,
                        textcolor: customBalck,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 400.h,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 60,
                                  bottom: 50,
                                  right: 5,
                                ).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: const AppText(
                                        text: "Problem",
                                        weight: FontWeight.w400,
                                        size: 14,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: const AppText(
                                        text: "Place",
                                        weight: FontWeight.w400,
                                        size: 14,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: const AppText(
                                        text: "Date",
                                        weight: FontWeight.w400,
                                        size: 14,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: const AppText(
                                        text: "Time",
                                        weight: FontWeight.w400,
                                        size: 14,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 50, right: 10).r,
                                    //   child: SizedBox(width: 20),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 400.h,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 60, bottom: 50).r,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: AppText(
                                        text: ": ${widget.issue}",
                                        weight: FontWeight.w500,
                                        size: 14,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: AppText(
                                        text: ": ${widget.place}",
                                        weight: FontWeight.w400,
                                        size: 12,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: AppText(
                                        text: ": ${widget.date}",
                                        weight: FontWeight.w400,
                                        size: 12,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: AppText(
                                        text: ": ${widget.time}",
                                        weight: FontWeight.w400,
                                        size: 12,
                                        textcolor: customBalck,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(left: 10, top: 50).r,
                                    //   child: getButton(),
                                    // ),
                                  ],
                                ),
                                
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                       getButton(),
                    ],
                  ),
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
          ),
        ),
      ],
    );
  }

  Widget getButton() {
    if (widget.status == '1') {
      // Status is '1', show Accept button
      return CustomButton(
        btnname: "Accept",
        textsize: 15,
        height: 40,
        btntheam: Colors.green,
        textcolor: white,
        click: () async {
          print('Accept button clicked');
          await FirebaseFirestore.instance.collection('mechrequest').doc(widget.req_id).update({
            'status': '1',
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AcceptScreen(
          //     req_id:widget.req_id,
          //     date:widget.date,
          //     time:widget.time,
          //     place:widget.place,
          //     issue: widget.issue

          //     ),
          //   ),
          // );
          setState(() {
            Navigator.pop(context);
          });
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //    builder: (ctx){
          //     return MechHome();
          //    }
          //   ),
          // );

        },
      );
    } else if (widget.status == '2') {
      // Status is '2', show Reject button
      return CustomButton(
        btnname: "Reject",
        height: 40,
        textsize: 15,
        btntheam: Colors.red,
        textcolor: white,
        click: () {
          print('Reject button clicked');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RejectScreen(),
            ),
          );
        },
      );
    } 
    else {
      // Default case: Status is '0' or unknown, show both Accept and Reject buttons
      return Row(
        children: [
          Expanded(
            child: CustomButton(
              btnname: "Accept",
              textsize: 15,
              height: 40,
              btntheam: Colors.green,
              textcolor: white,
              click: () async {
                print('Accept button clicked');
                await FirebaseFirestore.instance.collection('mechrequest').doc(widget.req_id).update({
                  'status': '1',
                });
                setState(() {
            Navigator.push(
            context,
            MaterialPageRoute(
             builder: (ctx){
              return MechHome();
             }
            ),
          );
          });
              },
            ),
          ),
          SizedBox(width: 10), // Add some spacing between buttons
          Expanded(
            child: CustomButton(
              btnname: "Reject",
              height: 40,
              textsize: 15,
              btntheam: Colors.red,
              textcolor: white,
              click: () async {
                print('Reject button clicked');
                await FirebaseFirestore.instance.collection('mechrequest').doc(widget.req_id).update({
                  'status': '2',
                });
               
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RejectScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
  }
}
