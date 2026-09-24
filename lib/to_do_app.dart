


import 'package:flutter/material.dart';
import 'package:to_do_app/fetures/creating_profile/create_profile_screen.dart';

class ToDoApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CreateProfileScreen(),
    );
  }
}