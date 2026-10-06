

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksNumber extends StatelessWidget {
  const TasksNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              20.verticalSpace,
              Text("12",style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
              Text("tasks",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
            ],
          ),
          Column(
            children: [
              20.verticalSpace,
              Text("7",style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
              Text("done",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
            ],
          ),
          Column(
            children: [
              20.verticalSpace,
              Text("5",style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
              Text("pending",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Colors.white
              ),),
            ],
          ),
        ],
      ),
    );
  }
}