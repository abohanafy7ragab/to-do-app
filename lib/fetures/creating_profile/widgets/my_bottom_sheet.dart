import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/fetures/creating_profile/widgets/main_bottom.dart';

class MyBottomSheet extends StatelessWidget {
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  const MyBottomSheet({super.key,required this.onTap1,required this.onTap2});
  static XFile? photo;
  // void pickeImagefromCamera() async {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainBottom(
            title: "camera",
            onTap: onTap1
          ),
          25.verticalSpace,
          MainBottom(
            title: "gallery",
            onTap:onTap2,
          ),
        ],
      ),
    );
  }
}
