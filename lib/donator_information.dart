import 'package:flutter/material.dart';

class donatorInformation extends StatelessWidget {
  const donatorInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('information'),
      ),
      body: const Center(
        child: Text('Informations provided'),
      ),
    );
  }
}
