import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/admin_screen/adminPage.dart';
import 'package:flutter_application_6/app_information.dart';
import 'package:flutter_application_6/category_item.dart';
import 'package:flutter_application_6/catgories_screen.dart';
import 'package:flutter_application_6/login_screen.dart';
import 'package:flutter_application_6/registration/Signup.dart';
import './Login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoriesScreen();
        },
      ),
    );
  }

  final auth = FirebaseAuth.instance;
  var formKey = GlobalKey<FormState>();
  Userid(value) async {
    var user = (await FirebaseFirestore.instance
        .collection('users')
        .doc(value.user!.uid)
        .get());

    var id = user.data();

    if (id!['role'] == 'user') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => loginScreen(context)));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AdminPage()));
    }
  }

  final _email = TextEditingController();
  final _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.help),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const app_Information()));
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: const Text(
            'Blood Donation ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 800,
            decoration: const BoxDecoration(
              image: const DecorationImage(
                centerSlice: Rect.zero,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/Splash.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Form(
                  key: formKey,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                      child: TextFormField(
                        controller: _email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email address',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                      child: TextFormField(
                        obscureText: true,
                        controller: _pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Please Enter Your Password';
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Password',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 35, 30, 10),
                      child: ElevatedButton(
                        child: Container(
                          // ignore: prefer_const_constructors
                          child: Text(
                            'Login',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            try {
                              await auth
                                  .signInWithEmailAndPassword(
                                      email: _email.text.trim(),
                                      password: _pass.text.trim())
                                  .then((value) => {Userid(value)});
                              _email.clear();
                              _pass.clear();
                            } on FirebaseAuthException catch (e) {
                              var snackbar = const SnackBar(
                                  content:
                                      Text('Email or Password Is not correct'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(40, 20, 40, 15)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 12, 40, 14),
                      child: TextButton(
                          child: const Text(
                            'Create New account',
                            style: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          }),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
