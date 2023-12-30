import 'package:break_down_assistance/widgets/mecanicStatusTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ServiceScreen.dart';

class UserMecList extends StatelessWidget {
  const UserMecList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 34, right: 34).r,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MechanicStatusTile(
                image: "assets/men3.png",
                name: "name",
                experience: "2+ year experience",
                work: "Fuel leaking",
                status: true,
                // if status is true is mechanic available /false not available......
                click: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceScreen(),
                      ));
                },
              );
            },
            itemCount: 10,
          )),
    );
  }
}
