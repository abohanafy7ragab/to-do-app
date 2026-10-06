import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/task_colors.dart';
import 'package:to_do_app/fetures/add_task/widgets/color_circle.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? myValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(239, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  50.horizontalSpace,
                  Text(
                    "Add task",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight(400)),
                  )
                ],
              ),
              40.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "task title",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
              TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              ///////////////////////////////////  1111111
              15.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
              TextField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                maxLines: 3,
                minLines: 3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r)),
                    hintText: "Task Description ..",
                    fillColor: Colors.white,
                    filled: true),
              ),
              /////////////////////////22222222
              15.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
              DropdownMenu(
                width: double.infinity,
                hintText: myValue ?? "pending",
                dropdownMenuEntries: [
                  DropdownMenuEntry(label: "pending", value: "pending"),
                  DropdownMenuEntry(label: "done", value: "done"),
                  DropdownMenuEntry(label: "in progress", value: "in progress"),
                ],
                onSelected: (value) {
                  myValue = value;
                },
              ),
              15.verticalSpace,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Choose color",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
              15.verticalSpace,
              Row(
                children: [
                  for (int i = 0; i < colors.length; i++)
                    Row(
                      children: [
                        ColorCircle(
                          color: colors[i],
                          i: i,
                          onTap: () {
                            setState(() {
                              selecting(i);
                            });
                          },
                        ),
                        10.horizontalSpace
                      ],
                    ),
                ],
              ),
              30.verticalSpace,
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.indigo
                ),
                child: Center(
                  child: Text("save task",style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight(600)
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> colors = [
  TaskColors.green,
  TaskColors.blue,
  TaskColors.purple,
  TaskColors.red,
  TaskColors.orange,
  TaskColors.teal,
];
List<bool> isSelected2 = [true, ...List.filled(5, false)];

void selecting(int i) {
  isSelected2 = List.filled(6, false);
  isSelected2[i] = true;
}
