import 'package:flutter/material.dart';

import '../../widgets/acceptTile.dart';

class AcceptedList extends StatelessWidget {
  const AcceptedList({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        ListView.builder(
      itemBuilder: (context, index) {
        return const AcceptTile(
          image: "assets/men.png",
          name: "name",
          issue: "Fuel leaking",
          date: 'date',
          time: "time",
          place: "place ",
          status: true, // if status is true payment success/else payment is pending.....
        );
      },
      itemCount: 10,
    );
    //);
  }
}
