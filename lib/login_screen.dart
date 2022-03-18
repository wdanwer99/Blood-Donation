import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/catgories_screen.dart';
import 'package:flutter_application_6/donator.dart';
import 'package:flutter_application_6/registration/Login.dart';
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 33,
                ))
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: const Text(
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
                    child: const Text(
                      'Donator',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const donator()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, left: 130),
                child: ElevatedButton(
                  child: const Text(
                    'Patient',
                    style: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
