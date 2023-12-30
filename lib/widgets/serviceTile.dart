import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/color.dart';
import 'apptext.dart';

class ServiceTile extends StatefulWidget {
  ServiceTile({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  final String title;
  final String id;

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: maincolor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.r, right: 20.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppText(
                  text: widget.title,
                  weight: FontWeight.w400,
                  size: 13,
                  textcolor: customBalck,
                ),
              ),
              InkWell(
                onTap: () {
                  _showDeleteConfirmationDialog();
                },
                child: const Icon(
                  Icons.delete,
                  color: customBalck,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Service'),
          content: Text('Are you sure you want to delete this service?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await _deleteService();
               
                // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

   Future<void> _deleteService() async {
    print('Deleting service with ID: ${widget.id}');
    try {
      await FirebaseFirestore.instance
          .collection('service')
          .doc(widget.id)
          .delete();
      print('Service deleted successfully');
       setState(() {
                  Navigator.of(context).pop(); 
                });
      // Refresh the page by triggering a rebuild
      setState(() {});
    } catch (e) {
      print('Error deleting service: $e');
      // Handle the error as needed (show a message, log, etc.)
    }
  }
}
