import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/fetures/creating_profile/widgets/main_bottom.dart';
import 'package:to_do_app/fetures/creating_profile/widgets/my_bottom_sheet.dart';
import 'package:to_do_app/fetures/home/home_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final picker = ImagePicker();
  void pickeImagefromCamera() async {
    MyBottomSheet.photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void pickeImagefromGallery() async {
    MyBottomSheet.photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
  void onTap1() {
    Navigator.pop(context);
    pickeImagefromCamera();
  }
  void onTap2() {
    Navigator.pop(context);
    pickeImagefromGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ////////////////////////////////////////////
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => MyBottomSheet(
                      onTap1: onTap1,
                      onTap2: onTap2,
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: MyBottomSheet.photo == null
                      ? Colors.grey.shade400
                      : null,

                  backgroundImage: MyBottomSheet.photo == null
                      ? Image.file(File(MyBottomSheet.photo?.path ?? "")).image
                      : null,
                  child: MyBottomSheet.photo == null
                      ? Icon(Icons.person, size: 80)
                      : null,
                ),
              ),
              ///////////////////////////////////////////////////
              Text(
                "create your profile",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight(600)),
              ),
              Text(
                "add your name and your profile picture",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight(600)),
              ),
              10.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "fullname",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
              10.verticalSpace,
              TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
              30.verticalSpace,
              MainBottom(
                title: "continuee",
                 onTap: (){
                  Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context)
                   =>HomeScreen()));
                 }
              )
            ],
          ),
        ),
      ),
    );
  }
}
