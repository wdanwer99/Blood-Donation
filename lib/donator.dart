// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class donator extends StatelessWidget {
  const donator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Blood Donation ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 150, 15, 0),
              child: Text(
                'You Are Saving Life',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.redAccent,
                  //backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
