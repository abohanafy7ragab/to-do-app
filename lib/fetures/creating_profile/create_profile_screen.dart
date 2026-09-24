import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CreateProfileScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("create profile".tr()),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(Locale('ar'));
              }else{
                context.setLocale(Locale('en'));
              }
            },
            icon: Icon(Icons.language),
          ),
        ],
      ),
    );
  }
}
