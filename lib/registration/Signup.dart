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

  TextEditingController pass2 = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');
  String? valuechoose;
  String? _value;
  var id;
  var data;
  List<String> splitlist = [];
  List<String> indexList = [];
  getUserid(value) {
    final data = users.doc(value.user!.uid);
  }

  List bloodtype = ['A+', 'A-', 'B+', 'B-', 'O-', 'O+', 'AB+', 'AB-'];
  List gender = ['Male', 'Female'];
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
            Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: TextFormField(
                        controller: name,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Full Name',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: TextFormField(
                        controller: email,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: 'Email address',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: TextFormField(
                        controller: location,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on),
                            hintText: 'Location',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButton(
                        underline: Container(),
                        items: bloodtype.map((itemvalue) {
                          return DropdownMenuItem(
                            value: itemvalue,
                            child: Text(itemvalue),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: const Text(
                          ' Select your blood type',
                        ),
                        value: valuechoose,
                        onChanged: (newValue) {
                          setState(
                            () {
                              valuechoose = newValue.toString();
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButton(
                        underline: Container(),
                        items: gender.map((itemvalue) {
                          return DropdownMenuItem(
                            value: itemvalue,
                            child: Text(itemvalue),
                          );
                        }).toList(),
                        isExpanded: true,
                        hint: const Text(
                          ' Gender',
                        ),
                        value: _value,
                        onChanged: (newValue) {
                          setState(
                            () {
                              _value = newValue.toString();
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                      child: TextFormField(
                        controller: phone_number,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            hintText: 'Phone number',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: pass,
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                        },
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'password',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: TextFormField(
                        controller: pass2,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Empty';
                          }

                          if (val != pass.text) return 'Not Match';
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Confirm password',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w300),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
              child: ElevatedButton(
                child: const Text(
                  'Signup',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
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
                                  'Blood_type': valuechoose,
                                  'Gender': _value,
                                  'index': indexList,
                                  'role': 'user',
                                }),
                                email.clear(),
                                pass.clear(),
                                pass2.clear(),
                                phone_number.clear(),
                                location.clear(),
                                name.clear(),
                              });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(40, 15, 40, 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
