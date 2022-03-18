import 'dart:ui';

import 'package:flutter/material.dart';

class app_Information extends StatelessWidget {
  const app_Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('information'),
      ),
      body: Center(
        child: Container(
          child: const Text(
            'If life easier on your mobile phone, use our Donate Blood app for all your blood donation needs. Its fast, efficient, and all at your fingertips: a great way to book and manage your donations any time or place. With the app, you can:\n >register as a blood donor with Lifeblood\n ',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontStyle: FontStyle.italic,
              //backgroundColor: Colors.redAccent,
            ),
          ),
          height: 800,
          decoration: const BoxDecoration(
            image: DecorationImage(
              centerSlice: Rect.zero,
              alignment: Alignment.center,
              image: const AssetImage('assets/Splash.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ),
    );
  }
}
