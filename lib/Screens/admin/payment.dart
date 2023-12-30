import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color.dart';
import '../../widgets/paymentTile.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CircleAvatar(
            radius: 30.r,
            backgroundImage: const AssetImage("assets/admin.png"),
          ),
        ),
        backgroundColor: lightBlue,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30).r,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const PaymentTile(
                  name: "name",
                  date: "12/12/2023",
                  amount: "5455",
                  service: "service",
                  mechanic_name: "mechanic_name");
            },
            itemCount: 10,
          ),
        ));
  }
}
