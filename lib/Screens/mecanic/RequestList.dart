import 'package:flutter/material.dart';

import '../../widgets/requestTile.dart';
import 'RequestScreen.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        ListView.builder(
      itemBuilder: (context, index) {
        return RequestTile(
          image: "assets/men.png",
          name: "name",
          issue: "Fuel leaking ",
          date: 'date',
          time: "time",
          place: "kozhikode ",
          click: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RequestScreen(),
                ));
          },
        );
      },
      itemCount: 10,
    );
    //);
  }
}
