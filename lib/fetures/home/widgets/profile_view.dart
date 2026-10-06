

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(35),
              ),
              child:Center(child: Icon(Icons.person))
            ),
            20.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("good moorning",style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                ),),
                Text("Mahmoud",style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight(700)
                ),),
              ],
            ),
          ],
        ),
        Icon(Icons.notifications,color: Colors.amber,)
      ],
    );
  }
}