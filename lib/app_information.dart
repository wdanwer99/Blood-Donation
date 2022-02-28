import 'package:flutter/material.dart';

class app_Information extends StatelessWidget {
  const app_Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('information'),
      ),
      body: Center(
        child: Text(
          'Informations provided ',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            color: Colors.redAccent,
            //backgroundColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
