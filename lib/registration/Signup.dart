import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_6/registration/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone_number = TextEditingController();
  TextEditingController blood_type = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');

  var id;
  var data;
  List<String> splitlist = [];
  List<String> indexList = [];
  getUserid(value) {
    final data = users.doc(value.user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Blood Donation ',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Full Name',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email address',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: location,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: 'Location',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: phone_number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: 'Phone number',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: blood_type,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bloodtype),
                    hintText: 'Blood Type',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: gender,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_add),
                    hintText: 'Gender',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'password',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: TextField(
                controller: pass2,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 10),
              child: ElevatedButton(
                child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  try {
                    await auth
                        .createUserWithEmailAndPassword(
                            email: email.text.trim(),
                            password: pass.text.trim())
                        .then((value) => {
                              splitlist = name.text.split(' '),
                              for (int i = 0; i < splitlist.length; i++)
                                {
                                  for (int j = 1;
                                      j < splitlist[i].length + 1;
                                      j++)
                                    {
                                      indexList.add(splitlist[i]
                                          .substring(0, j)
                                          .toLowerCase()),
                                    }
                                },
                              users.doc(value.user!.uid).set({
                                'id': value.user!.uid,
                                'name': name.text,
                                'email': email.text,
                                'location': location.text,
                                'Phone_Number': phone_number.text,
                                'Blood_type': blood_type.text,
                                'Gender': gender.text,
                                'index': indexList,
                                'role': 'user',
                              }),
                              email.clear(),
                              pass.clear(),
                              blood_type.clear(),
                              pass2.clear(),
                              phone_number.clear(),
                              gender.clear(),
                              location.clear(),
                              name.clear(),
                            });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
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
