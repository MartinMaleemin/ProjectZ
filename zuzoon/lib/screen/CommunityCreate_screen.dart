import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:zuzoon/model/Community_data.dart';
import 'package:zuzoon/model/User_data.dart';
import 'package:zuzoon/provider/community_provider.dart';

class createCommunity_page extends StatefulWidget {
  const createCommunity_page({Key? key}) : super(key: key);

  @override
  State<createCommunity_page> createState() => _createCommunity_pageState();
}

class _createCommunity_pageState extends State<createCommunity_page> {
  final _formkey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  User_data login_user = User_data();
  final _titleController = new TextEditingController();
  final _desController = TextEditingController();

  // CollectionReference _communityCollection =
  //     FirebaseFirestore.instance.collection('community');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: SafeArea(
              child: Form(
            key: _formkey,
            child: Column(children: [
              //app bar
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //back
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //community
                          Text(
                            'Create Comunity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              //commu pic
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.all(Radius.circular(180))),
              ),
              SizedBox(
                height: 50,
              ),
              //commu name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: _titleController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Community title has required.");
                        }
                      },
                      onSaved: (title) {
                        _titleController.text = title!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Community Name',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              //desciption
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: _desController,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (des) {
                        _desController.text = des!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Description',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),

              //create btm
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GestureDetector(
                  onTap: () async {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      createCommu(title: _titleController.text);
                      addCommunity();

                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ]),
          )),
        ));
  }

  String? docId;
  final docCommu = FirebaseFirestore.instance.collection('community').doc();

  Future createCommu({required String title}) async {
    final commu = Community_data(
      c_id: docCommu.id,
      c_title: title,
      c_desciption: _desController.text,
    );

    setState(() {
      docId = docCommu.id;
    });

    final json = commu.toJson();
    await docCommu.set(json);
  }

  
  Future<String?> addCommunity() async {
    CollectionReference commu = FirebaseFirestore.instance
        .collection('user')
        .doc(login_user.uid)
        .collection('community');
    var result = await commu.add({
      'eventid': docId,
    }).then((value) {
      print('add $docId in user ${login_user.uid}');
    });
  }
}
