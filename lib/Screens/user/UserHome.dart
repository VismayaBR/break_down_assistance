import 'package:break_down_assistance/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UserNotification.dart';
import 'UserProfile.dart';
import 'UserRequest.dart';
import 'UsermechList.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          Container(
            height: 100.h,
            width: double.infinity,
            color: maincolor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          // go to user profile screen..
                          builder: (context) => UserProfile(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const AssetImage("assets/admin.png"),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20).r,
                    child: SizedBox(
                        height: 30.h,
                        child: TextFormField(
                          controller: search,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              fillColor: white,
                              filled: true,
                              hintText: "Search",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12).r,
                                  borderSide: const BorderSide(color: white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12).r,
                                  borderSide: const BorderSide(color: white)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12).r,
                                  borderSide: const BorderSide(
                                    color: white,
                                  ))),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          // got to notification screen.....
                          builder: (context) => const UserNotification(),
                        ));
                  },
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.yellow[800],
                        size: 30,
                      ),
                       Positioned(
                          // notification Icon......
                          left: 15.r,
                          top: 5.r,
                          child: CircleAvatar(
                            radius: 6.r,
                            backgroundColor: Colors.red,
                          )),
                    ],
                  ),
                )
              ]),
            ),
          ),
          const Expanded(
              child: TabBarView(children: [
                UserMecList(), 
                UserRequest()
                ])),
          Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, bottom: 40).r,
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r, color: lightBlue),
              child: TabBar(
                tabs: [
                  Tab(
                      child: Text(
                    "Mechanic",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp, fontWeight: FontWeight.w500),
                  )),
                  Tab(
                    child: Text(
                      "Request",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10).r),
                    // Creates border
                    color: customBlue),
                labelColor: white,
                dividerColor: Colors.transparent,
                unselectedLabelColor: customBalck,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
