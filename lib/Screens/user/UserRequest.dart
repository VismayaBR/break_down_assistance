import 'package:break_down_assistance/widgets/userRequestTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRequest extends StatelessWidget {
  const UserRequest({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, right: 34),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('mechrequest').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          var requests = snapshot.data!.docs;

          return ListView.builder(
            itemBuilder: (context, index) {
              var request = requests[index].data() as Map<String, dynamic>;

              return UserRequestTile(
                
                mech_id: request['mech_id'] ?? "Unknown",
                date: request['date'] ?? "",
                time: request['time'] ?? "",
                issue: request['issue'] ?? "",
                status: request['status'] ?? "",
                amount: request['amount'] ?? "",
                r_id: requests[index].id,
                reason: request['reason'] ?? ""

              );
            },
            itemCount: requests.length,
          );
        },
      ),
    );
  }
}
