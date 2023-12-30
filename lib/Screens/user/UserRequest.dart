import 'package:break_down_assistance/widgets/userRequestTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRequest extends StatelessWidget {
  const UserRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // body:
        Padding(
            padding: const EdgeInsets.only(left: 34, right: 34),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const UserRequestTile(
                    name: "name",
                    date: "date",
                    time: "time",
                    issue: "Fuel leaking");
              },
              itemCount: 10,
            ));

    // );
  }
}
