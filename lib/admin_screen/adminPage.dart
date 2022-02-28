import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/registration/Login.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  bool searchState = false;
  String searchkey = '';
  Stream<QuerySnapshot> donor = FirebaseFirestore.instance
      .collection('users')
      .where('role', isEqualTo: 'user')
      .snapshots();
  FirebaseAuth auth = FirebaseAuth.instance;
  var update_data2 = FirebaseFirestore.instance.collection('users');
  var bloodtype = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: TextField(
            onChanged: (value) {
              setState(() {
                searchkey = value;
              });
            },
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () async {
                  await auth.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                })
          ],
        ),
        body: StreamBuilder(
            stream: (searchkey == null || searchkey.trim() == "")
                ? donor
                : FirebaseFirestore.instance
                    .collection('users')
                    .where('index', arrayContains: searchkey)
                    .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var data = snapshot.requireData;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Text('There is Not Donators');
              }
              return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 3),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 8,
                                  offset: Offset(5, 5))
                            ]),
                            height: 80,
                            child: Card(
                                child: InkWell(
                              onTap: () {
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
                                                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=>E_Bottumnav()));
                                                    },
                                                    icon: Icon(
                                                        Icons.arrow_back_ios),
                                                    color: Colors.white,
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 100,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Card(
                                                  color: Colors.white,
                                                  child: ListTile(
                                                    leading: Icon(Icons.person,
                                                        color: Colors.black),
                                                    title: Text(
                                                      data.docs[index]['name'],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Card(
                                                  color: Colors.white,
                                                  child: ListTile(
                                                    leading: Icon(Icons.phone,
                                                        color: Colors.black),
                                                    title: Text(
                                                      data.docs[index]
                                                          ['Phone_Number'],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Card(
                                                  color: Colors.white,
                                                  child: ListTile(
                                                    leading: Icon(
                                                        Icons.bloodtype,
                                                        color: Colors.black),
                                                    title: Text(
                                                      data.docs[index]
                                                          ['Blood_type'],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Card(
                                                  color: Colors.white,
                                                  child: ListTile(
                                                    leading: Icon(
                                                        Icons.my_location,
                                                        color: Colors.black),
                                                    title: Text(
                                                      data.docs[index]
                                                          ['location'],
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
                              },
                              child: ListTile(
                                title: Text(
                                  data.docs[index]['name'],
                                  style: TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Container(
                                                    height: 450,
                                                    width: 450,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Update Blood type',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          controller: bloodtype,
                                                          decoration: InputDecoration(
                                                              labelText:
                                                                  'Blood type',
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10))),
                                                        ),
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    primary:
                                                                        Colors
                                                                            .red),
                                                            onPressed:
                                                                () async {
                                                              await (update_data2
                                                                  .doc(data
                                                                      .docs[
                                                                          index]
                                                                      .id)
                                                                  .update({
                                                                'Blood_type':
                                                                    bloodtype
                                                                        .text,
                                                              }));
                                                              bloodtype.text =
                                                                  '';
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'Update')),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    content: Container(
                                                      height: 60,
                                                      width: 100,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'Confirm Deleting',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      primary: Colors
                                                                          .grey
                                                                          .shade500),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'No')),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await (update_data2
                                                                        .doc(data
                                                                            .docs[index]
                                                                            .id)
                                                                        .delete());
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Yes'))
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                            /* */
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ),
                      ],
                    );
                  });
            }));
  }

  var formKey = GlobalKey<FormState>();
  Userid(value) async {
    var user = (await FirebaseFirestore.instance
        .collection('users')
        .doc(value.user!.uid)
        .get());

    var id = user.data();
  }
}
