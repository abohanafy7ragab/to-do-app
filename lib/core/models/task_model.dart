import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:to_do_app/core/task_colors.dart';
part 'task_model.g.dart';
@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? status;
  @HiveField(3)
  Color? color =TaskColors.green;
  TaskModel({
  this.title,
  this.description,
  this.status,
  this.color
  });
}
