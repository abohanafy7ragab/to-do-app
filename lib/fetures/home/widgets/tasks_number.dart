

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/fetures/home/home_screen.dart';

class TasksNumber extends StatelessWidget {
  TasksNumber({super.key});
  int doneTasks = tasks.fold<int>(0,(count,task)=>
                 task.status=="done"?count+1:count);
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
              Text("${tasks.length}",style: TextStyle(
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
              Text("${doneTasks}",style: TextStyle(
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
              Text("${tasks.length-doneTasks}",style: TextStyle(
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