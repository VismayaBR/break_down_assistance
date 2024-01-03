import 'package:break_down_assistance/widgets/mecanicStatusTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ServiceScreen.dart';

class UserMecList extends StatelessWidget {
  const UserMecList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 34, right: 34).r,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('mechanic').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            var mechanics = snapshot.data!.docs;

            return ListView.builder(
              itemBuilder: (context, index) {
                var mechanic = mechanics[index].data() as Map<String, dynamic>;

                return MechanicStatusTile(
                  image: "assets/men3.png",
                  name: mechanic['username'] ?? "Unknown",
                  experience: '${mechanic['service']}' ?? "Experience not available",
                  work: mechanic['phone'] ?? "Work not available",
                  status: true ?? false,
                  click: () {
                    // Pass relevant data to the ServiceScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceScreen(name:mechanic['username'],exp:mechanic['experience'],mob:mechanic['phone'],mech:mechanics[index].id),
                      ),
                    );
                  },
                );
              },
              itemCount: mechanics.length,
            );
          },
        ),
      ),
    );
  }
}
