import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/fetures/add_task/add_task_screen.dart';

class ColorCircle extends StatelessWidget {
  int i;
  VoidCallback onTap;
  ColorCircle(
      {super.key,
      required this.color,
      required this.onTap,
      required this.i
      });
  Color color;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            border: isSelected2[i]
                ? BoxBorder.all(color: Colors.black, width: 3.w)
                : null,
            color: color,
            borderRadius: BorderRadius.circular(20.r)),
      ),
    );
  }
}
