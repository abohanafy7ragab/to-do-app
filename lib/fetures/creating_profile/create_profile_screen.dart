import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/fetures/creating_profile/widgets/my_bottom_sheet.dart';

class CreateProfileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(),
                  );
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.grey.shade400,
                  child:MyBottomSheet.photo== null? Icon(Icons.person, size: 80):Image.file(File(MyBottomSheet.photo?.path??"")),
                ),
              ),
              Text("create your profile",style: TextStyle(fontSize: 27,
              fontWeight:FontWeight(600) ),),
              Text("add your name and your profile picture",style: TextStyle(fontSize: 15,
              fontWeight:FontWeight(600) ),),
              Align(
                alignment: Alignment.topLeft,
                child: Text("fullname",style: TextStyle(fontSize: 15,
                fontWeight:FontWeight(600) ),),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
          
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
