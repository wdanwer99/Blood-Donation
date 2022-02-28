import 'package:flutter/material.dart';

class donatorInformation extends StatelessWidget {
  const donatorInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('information'),
      ),
      body: Center(
        child: Text('Informations provided'),
      ),
    );
  }
}
