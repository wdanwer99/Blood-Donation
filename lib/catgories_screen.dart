// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_6/donator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './category_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Stream<QuerySnapshot> donor = FirebaseFirestore.instance
      .collection('users')
      .where('role', isEqualTo: 'user')
      .snapshots();
  String searchkey = '';
  bool searchState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchkey = value;
            });
          },
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 30,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: (searchkey == null || searchkey.trim() == "")
            ? donor
            : FirebaseFirestore.instance
                .collection('users')
                .where('Blood_type', isEqualTo: searchkey)
                .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var data = snapshot.requireData;
          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              return _donator(
                  data.docs[index]['name'],
                  data.docs[index]['location'],
                  data.docs[index]['Phone_Number'],
                  data.docs[index]['Blood_type']);
            },
          );
        },
      ),
    );
  }

  _donator(String name, String adress, String phone, String bloodType) {
    donator_description(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.person, color: Colors.black),
                        title: Text(
                          name,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.phone, color: Colors.black),
                        title: Text(
                          phone,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.bloodtype, color: Colors.black),
                        title: Text(
                          bloodType,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.my_location, color: Colors.black),
                        title: Text(
                          adress,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
      child: InkWell(
        onTap: () {
          donator_description(context);
        },
        child: Container(
          height: 85,
          width: 200,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade600,
                    blurRadius: 8,
                    offset: Offset(5, 5))
              ],
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  ' + name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Text(
                '   ' + bloodType + '   ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void SearchMethod(String text) {}
}
