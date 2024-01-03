import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../constants/color.dart';
import '../../widgets/apptext.dart';
import '../../widgets/ratingTile.dart';

class Rating extends StatelessWidget {
  const Rating({Key? key});

  Future<List<Map<String, dynamic>>> getRatings() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('rating').get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<String?> getMechanicName(String mechanicId) async {
    try {
      DocumentSnapshot mechanicSnapshot = await FirebaseFirestore.instance
          .collection('mechanic')
          .doc(mechanicId)
          .get();

      if (mechanicSnapshot.exists) {
        return mechanicSnapshot['username'];
      }
    } catch (error) {
      print('Error fetching mechanic details: $error');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: const Icon(
            Icons.arrow_back_ios,
            color: customBalck,
          ),
        ),
        backgroundColor: maincolor,
        title: const AppText(
          text: "Rating",
          weight: FontWeight.w400,
          size: 20,
          textcolor: customBalck,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppText(
              text: "The rating given to you",
              weight: FontWeight.w400,
              size: 10,
              textcolor: Colors.grey,
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getRatings(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  List<Map<String, dynamic>> ratings = snapshot.data!;

                  return ListView.builder(
                    itemCount: ratings.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<String?>(
                        future: getMechanicName(ratings[index]['mech_id'].toString()),
                        builder: (context, mechanicSnapshot) {
                          if (mechanicSnapshot.connectionState == ConnectionState.waiting) {
                            return SizedBox(
                              height: 30,
                              width: 30,
                              // child: CircularProgressIndicator(),
                            );
                          }

                          var ratingData = ratings[index];
                          String mechanicName = mechanicSnapshot.data ?? 'Unknown Mechanic';

                          return RatingTile(
                            image: "assets/men.png",
                            name: mechanicName,
                            work: ratingData['rating'].toString(),
                            date: '',
                            time: '',
                            place: '',
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
