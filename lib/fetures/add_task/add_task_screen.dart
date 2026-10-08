import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:to_do_app/core/models/app_constants.dart';
import 'package:to_do_app/core/models/task_model.dart';
import 'package:to_do_app/core/task_colors.dart';
import 'package:to_do_app/fetures/add_task/widgets/color_circle.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String? myValue ;
  var titleControlller = TextEditingController();
  var descriptionControlller = TextEditingController();
  var statusControlller = TextEditingController();

  int seclectedIndexColor = isSelected2.indexOf(true);
  @override
  void dispose() {
    titleControlller.dispose();
    descriptionControlller.dispose();
    statusControlller.dispose();
    super.dispose();
  }

  void saveTask(TaskModel task) {
    Hive.box<TaskModel>(AppConstants.taskBox).add(task).then((v) {
      // Navigator.pop(context);
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(239, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight(400)),
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
                ////////////////////////////////
                TextFormField(
                  controller: titleControlller,
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
                  controller: descriptionControlller,
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
                ///////////////////////
                DropdownMenu(
                  controller: statusControlller,
                  width: double.infinity,
                  hintText: myValue ?? "pending",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(label: "pending", value: "pending"),
                    DropdownMenuEntry(label: "done", value: "done"),
                    DropdownMenuEntry(
                        label: "in progress", value: "in progress"),
                  ],
                  onSelected: (value) {
                    myValue = value;
                    statusControlller.text = value!;
                  },
                ),
                ////////////////////////////////
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
                GestureDetector(
                  onTap: () {
                    saveTask(TaskModel(
                        title: titleControlller.text,
                        description: descriptionControlller.text,
                        status: statusControlller.text==""?"pending":
                         statusControlller.text,
                        color: colors[isSelected2.indexOf(true)]));
                    Navigator.pop(context);
                    
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigo),
                    child: Center(
                      child: Text(
                        "save task",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight(600)),
                      ),
                    ),
                  ),
                )
              ],
            ),
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
