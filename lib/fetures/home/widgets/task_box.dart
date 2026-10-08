import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/task_colors.dart';

class TaskBox extends StatelessWidget {
  final TaskModel task;
  const TaskBox({super.key, required this.task});

  Color get lightColor => task.color == Colors.green
      ? TaskColors.lGreen
      : task.color == Colors.blue
          ? TaskColors.lBlue
          : task.color == Colors.orange
              ? TaskColors.lOrange
              : task.color == Colors.red
                  ? TaskColors.lRed
                  : task.color == Colors.purple
                      ? TaskColors.lPurple
                      : TaskColors.lTeal;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // 15.horizontalSpace,
                Container(
                  width: 25.w,
                  height: 130.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: task.color),
                ),
                15.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${task.title}",
                      style: TextStyle(
                          fontSize: 25.sp, fontWeight: FontWeight(600)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${task.description}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight(400),
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: lightColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Text(
                        "${task.status}",
                        style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight(500),
                            color: task.color),
                      ),
                    )
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ,
                //   ),
                // );
              },
              child: SizedBox(
                width: 20.w,
                height: 140.h,
                child: Center(child: Icon(Icons.arrow_forward_ios)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
