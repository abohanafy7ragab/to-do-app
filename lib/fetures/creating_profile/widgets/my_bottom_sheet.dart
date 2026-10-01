import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/fetures/creating_profile/widgets/main_bottom.dart';

class MyBottomSheet extends StatefulWidget {
  new({super.key});
  static XFile? photo;
  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final picker = ImagePicker();
   
  pickeImagefromCamera() async {
    MyBottomSheet.photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  pickeImagefromGallery() async {
    MyBottomSheet.photo = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainBottom(
            title: "camera",
            onTap: () {
              Navigator.pop(context);
              pickeImagefromCamera();
            },
          ),
          25.verticalSpace,
          MainBottom(
            title: "gallry",
            onTap: () {
              Navigator.pop(context);
              pickeImagefromGallery();
            },
          ),
        ],
      ),
    );
  }
}
