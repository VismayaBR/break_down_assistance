import 'package:break_down_assistance/Screens/common/Log.dart';
import 'package:break_down_assistance/Screens/user/UsermechList.dart';
import 'package:break_down_assistance/constants/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'UserNotification.dart';
import 'UserProfile.dart';
import 'UserRequest.dart';


class UserHome extends StatefulWidget {
  UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  final search = TextEditingController();

  late Stream<QuerySnapshot> _serviceStream;

  void _onSearchChanged(String query) {
    setState(() {
      _serviceStream = FirebaseFirestore.instance
          .collection('mechanic')
          .where('service', isGreaterThanOrEqualTo: query)
          .where('service', isLessThan: query + 'z')
          .snapshots();
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the stream with all mechanics initially
    _serviceStream = FirebaseFirestore.instance.collection('mechanic').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100.h,
              width: double.infinity,
              color: maincolor,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserProfile(),
                          ),
                        );
                      },
                      child: Icon(Icons.account_circle_rounded, size: 20),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20).r,
                        child: SizedBox(
                          height: 30.h,
                          child: TextFormField(
                            controller: search,
                            onChanged: _onSearchChanged,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              fillColor: white,
                              filled: true,
                              hintText: "Search",
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12).r,
                                borderSide: const BorderSide(color: white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12).r,
                                borderSide: const BorderSide(color: white),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12).r,
                                borderSide: const BorderSide(color: white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserNotification(),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.yellow[800],
                            size: 30,
                          ),
                          Positioned(
                            left: 15.r,
                            top: 5.r,
                            child: CircleAvatar(
                              radius: 6.r,
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: Icon(Icons.power_settings_new_outlined, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [UserMecList(stream: _serviceStream), UserRequest()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45, bottom: 40).r,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10).r,
                  color: lightBlue,
                ),
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Mechanic",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Request",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(10).r),
                    color: customBlue,
                  ),
                  labelColor: white,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: customBalck,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
