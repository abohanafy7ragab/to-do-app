import 'package:flutter/material.dart';

class MainBottom extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MainBottom({super.key,required this.title,required  this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      child: Container(
        height: 70,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration( 
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
