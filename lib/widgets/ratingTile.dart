import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color.dart';
import 'apptext.dart';

class RatingTile extends StatefulWidget {
  RatingTile({
    super.key,
    required this.image,
    required this.name,
    required this.work,
    required this.date,
    required this.time,
    required this.place,
  });

  final String image;
  final String name;
  final String work;
  final String date;
  final String time;
  final String place;

  @override
  State<RatingTile> createState() => _RatingTaleState();
}

class _RatingTaleState extends State<RatingTile> {
  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: maincolor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10).r,
          child: Row(children: [
            SizedBox(
              width: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundImage: AssetImage(widget.image),
                  ),
                  AppText(
                      text: widget.name,
                      weight: FontWeight.w400,
                      size: 16,
                      textcolor: customBalck)
                ],
              ),
            ),
            SizedBox(
              width: 140,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: widget.work,
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                    AppText(
                        text: widget.date,
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                    AppText(
                        text: widget.time,
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                    AppText(
                        text: widget.place,
                        weight: FontWeight.w400,
                        size: 16,
                        textcolor: customBalck),
                  ]),
            ),
            Expanded(
                child: SizedBox(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText(
                        text: "Rating",
                        weight: FontWeight.w400,
                        size: 10,
                        textcolor: customBalck),
                    RatingBar.builder(
                      itemSize: 11,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          rate = rating;
                        });
                      },
                    ),
                    AppText(
                        text: "${rate.toStringAsFixed(0)}/5",
                        weight: FontWeight.w600,
                        size: 11,
                        textcolor: customBalck),
                  ]),
            ))
          ]),
        ),
      ),
    );
  }
}
