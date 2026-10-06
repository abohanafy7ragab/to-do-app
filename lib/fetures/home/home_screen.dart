import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/task_colors.dart';
import 'package:to_do_app/fetures/add_task/add_task_screen.dart';
import 'package:to_do_app/fetures/home/widgets/profile_view.dart';
import 'package:to_do_app/fetures/home/widgets/task_box.dart';
import 'package:to_do_app/fetures/home/widgets/tasks_number.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(239, 255, 255, 255),
      // bottomNavigationBar: BottomNavigationBar(items: items),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: Stack(
            children: [
              Column(
                children: [
                  30.verticalSpace,
                  ProfileView(),
                  30.verticalSpace,
                  TasksNumber(),
                  30.verticalSpace,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Today's tasks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight(600),
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  TaskBox(task: tasks[0])
                ],
              ),
              Positioned(
                right: 15.w,
                bottom: 30.h,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: 
                      (context)=>AddTaskScreen()
                      )
                    );
                  },
                  child: Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 160, 194, 254)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add,color: Colors.black,),
                        Text("task",style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight(600),
                          color: Colors.black45
                        ),)
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<TaskModel> tasks =[
  TaskModel(
  title: "flutter UI",
  description: "Buld register screen",
  status: "pending",
  color:TaskColors.blue
  )
];
