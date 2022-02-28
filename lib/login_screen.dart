import 'package:flutter/material.dart';
import 'package:flutter_application_6/catgories_screen.dart';
import 'package:flutter_application_6/donator.dart';
import '../category_item.dart';

class loginScreen extends StatelessWidget {
  const loginScreen(BuildContext context, {Key? key}) : super(key: key);
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          final String title;
          final Color color;
          return CategoriesScreen();
        },
      ),
    );
  }

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
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.only(top: 200, left: 130),
                child: ElevatedButton(
                  child: Text(
                    'Donator',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => donator()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(40, 15, 40, 15)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80, left: 130),
              child: ElevatedButton(
                child: Text(
                  'Patient',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoriesScreen()));
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(40, 15, 40, 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
