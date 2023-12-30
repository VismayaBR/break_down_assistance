import 'package:break_down_assistance/widgets/notificationCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../widgets/apptext.dart';

class AdminNotification extends StatelessWidget {
  const AdminNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10).r,
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
          backgroundColor: maincolor,
          title: AppText(
              text: "Notification",
              weight: FontWeight.w400,
              size: 20.sp,
              textcolor: customBalck),
          centerTitle: true),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30).r,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const NotifiactionCard(
                  title: "Admin Notifiaction",
                  content: '',
                  time: "10.00 am",
                  date: '22/12/2023');
            },
            itemCount: 5,
          )),
    );
  }
}
