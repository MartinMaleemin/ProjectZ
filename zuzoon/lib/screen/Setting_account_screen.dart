import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zuzoon/model/firebaseStorage_service.dart';
import 'package:zuzoon/screen/Home_screen.dart';
import 'package:zuzoon/screen/Setting_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import '../model/User_data.dart';
import 'Login_screen.dart';

class settingAccount_page extends StatefulWidget {
  const settingAccount_page({Key? key}) : super(key: key);

  @override
  State<settingAccount_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<settingAccount_page> {
  final _usernameController = new TextEditingController();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _dateOfBirthController = new TextEditingController();
  final _picController = new TextEditingController();
  final path = new TextEditingController();
  var url = new TextEditingController();
  final Storage storage = Storage();

  FirebaseStorage _storage = FirebaseStorage.instance;
  UploadTask? _upload;

  User? user = FirebaseAuth.instance.currentUser;
  User_data login_user = User_data();

  File? _pickeImage;

  // void _cameraPicker() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.getImage(source: ImageSource.camera);
  //   final pickedImageFile = File(pickedImage!.path);
  //   setState(() {
  //     _pickeImage = pickedImageFile;
  //   });
  //   Navigator.pop(context);
  // }

  void _galleryPicker() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickeImage = pickedImageFile;
      path.text = pickedImage.path;
    });
    print('Path = $path');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then(((value) {
      this.login_user = User_data.fromMap(value.data());
      setState(() {});
    }));
  }

  String? get _uid => login_user.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(children: [
          //app bar
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Column(
                children: [
                  Text(
                    'Edit Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),

                          //user pic
                          Stack(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    color: Colors.teal[400],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 75,
                                      backgroundColor: Colors.grey[400],
                                      backgroundImage: _pickeImage == null
                                          ? null
                                          : FileImage(_pickeImage!)),
                                ),
                              ),
                              Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: GestureDetector(
                                    onTap: () {
                                      _galleryPicker();
                                      // showModalBottomSheet(
                                      //     backgroundColor: Colors.grey[600],
                                      //     context: context,
                                      //     builder: (context) {
                                      //       return Padding(
                                      //         padding:
                                      //             const EdgeInsets.symmetric(
                                      //                 horizontal: 10),
                                      //         child: Container(
                                      //           decoration: BoxDecoration(
                                      //               color: Colors.teal[300],
                                      //               borderRadius:
                                      //                   BorderRadius.only(
                                      //                       topLeft:
                                      //                           Radius.circular(
                                      //                         20,
                                      //                       ),
                                      //                       topRight:
                                      //                           Radius.circular(
                                      //                         20,
                                      //                       ))),
                                      //           height: 150,
                                      //           child: Column(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.center,
                                      //             children: [
                                      //               Padding(
                                      //                 padding: const EdgeInsets
                                      //                         .symmetric(
                                      //                     horizontal: 10),
                                      //                 child: Text(
                                      //                   'Choose your profile picture.',
                                      //                   style: TextStyle(
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                       fontSize: 20,
                                      //                       color: Colors
                                      //                           .grey[200]),
                                      //                 ),
                                      //               ),
                                      //               SizedBox(
                                      //                 height: 20,
                                      //               ),
                                      //               Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .spaceAround,
                                      //                 children: [
                                      //                   Container(
                                      //                     width: 120,
                                      //                     decoration:
                                      //                         BoxDecoration(
                                      //                             color: Colors
                                      //                                     .grey[
                                      //                                 200],
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .all(
                                      //                               Radius
                                      //                                   .circular(
                                      //                                       20),
                                      //                             ),
                                      //                             border: Border.all(
                                      //                                 color: Colors
                                      //                                     .blueGrey)),
                                      //                     child: FlatButton(
                                      //                       onPressed: () {
                                      //                         _cameraPicker();
                                      //                       },
                                      //                       child: Padding(
                                      //                         padding:
                                      //                             const EdgeInsets
                                      //                                 .all(8.0),
                                      //                         child: Column(
                                      //                           children: [
                                      //                             Icon(
                                      //                               Icons
                                      //                                   .camera_rounded,
                                      //                               color: Colors
                                      //                                       .deepPurple[
                                      //                                   300],
                                      //                             ),
                                      //                             SizedBox(
                                      //                               height: 5,
                                      //                             ),
                                      //                             Text(
                                      //                               'Camera',
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .deepPurple[
                                      //                                     300],
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                   Container(
                                      //                     width: 120,
                                      //                     decoration:
                                      //                         BoxDecoration(
                                      //                             color: Colors
                                      //                                     .grey[
                                      //                                 200],
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .all(
                                      //                               Radius
                                      //                                   .circular(
                                      //                                       20),
                                      //                             ),
                                      //                             border: Border.all(
                                      //                                 color: Colors
                                      //                                     .blueGrey)),
                                      //                     child: FlatButton(
                                      //                       onPressed: () {
                                      //                         _galleryPicker();
                                      //                       },
                                      //                       child: Padding(
                                      //                         padding:
                                      //                             const EdgeInsets
                                      //                                 .all(8.0),
                                      //                         child: Column(
                                      //                           children: [
                                      //                             Icon(
                                      //                               Icons
                                      //                                   .photo_library_rounded,
                                      //                               color: Colors
                                      //                                       .deepPurple[
                                      //                                   300],
                                      //                             ),
                                      //                             SizedBox(
                                      //                                 height:
                                      //                                     5),
                                      //                             Text(
                                      //                               'Gallery',
                                      //                               style:
                                      //                                   TextStyle(
                                      //                                 color: Colors
                                      //                                         .deepPurple[
                                      //                                     300],
                                      //                               ),
                                      //                             )
                                      //                           ],
                                      //                         ),
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       );
                                      //     });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.teal[400],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Icon(
                                        Icons.camera_alt_rounded,
                                        size: 45,
                                        color: Colors.grey[200],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //username
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
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regExp = new RegExp(r'^.{6,}$');
                    if (!regExp.hasMatch(value!)) {
                      return ("Username must be at least 6 characters.");
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '${login_user.username}',
                    border: InputBorder.none,
                    labelText: 'Username',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (value) {
                    _usernameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //name
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
                  controller: _firstNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: '${login_user.firstName}',
                    border: InputBorder.none,
                    labelText: 'First Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onSaved: (value) {
                    _firstNameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //lastname
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
                  controller: _lastNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: '${login_user.lastName}',
                    labelText: 'Last Name',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                  ),
                  onSaved: (value) {
                    _lastNameController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //date of birth
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
                  onTap: () async {
                    DateTime? _pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 80),
                        lastDate: DateTime.now());
                    if (_pickedDate != null) {
                      setState(() {
                        _dateOfBirthController.text =
                            DateFormat('d/M/yyy').format(_pickedDate);
                      });
                    }
                  },
                  readOnly: true,
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                    hintText: '${login_user.birthday}',
                    suffixIcon: Icon(Icons.today_rounded),
                    border: InputBorder.none,
                    labelText: 'Date of Birth',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          SizedBox(
            height: 25,
          ),

          //cencl lbtm
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 110,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Cencel',
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
              //save btm
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () async {
                    final User_data =
                        FirebaseFirestore.instance.collection('user').doc(_uid);
                    if (_usernameController.text.isEmpty) {
                      _usernameController.text = login_user.username!;
                    }
                    if (_firstNameController.text.isEmpty) {
                      _firstNameController.text = login_user.firstName!;
                    }
                    if (_lastNameController.text.isEmpty) {
                      _lastNameController.text = login_user.lastName!;
                    }
                    if (_dateOfBirthController.text.isEmpty) {
                      _dateOfBirthController.text = login_user.birthday!;
                    }
                    // if (_picController.text.isEmpty) {
                    //   _picController.text = login_user.pic!;
                    // }

                    //upload picture
                    // if (_pickeImage != null) {
                    //   Random r = Random();
                    //   int i = r.nextInt(10000);
                    //   final _path = path.text;
                    //   final fileName = 'profile$i.jpeg';
                    //   File _file = File(_path);

                    //   final Reference _ref =
                    //       _storage.ref().child('profile/$fileName');
                    //   _upload = _ref.putFile(_file);

                    //   final snapshot = await _upload!.whenComplete(() {});
                    //   final link = await snapshot.ref.getDownloadURL();
                    //   setState(() {
                    //     _picController.text = link;
                    //   });
                    //   print('${_picController.text}');
                    // }

                    //update specific filed
                    User_data.update({
                      'pic': _picController.text,
                      'username': _usernameController.text,
                      'firstName': _firstNameController.text,
                      'lastName': _lastNameController.text,
                      'birthday': _dateOfBirthController.text,
                    }).then((value) {
                      Fluttertoast.showToast(
                        msg: "Profile edited!",
                        gravity: ToastGravity.TOP,
                      );
                    });
                    Navigator.popUntil(
                        context, ModalRoute.withName('/homepage'));
                  },
                  child: Container(
                    width: 110,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
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
            ],
          ),
          SizedBox(
            height: 30,
          )
        ])),
      ),
    );
  }

  // Future<void> upload() async {
  //   Random r = Random();
  //   int i = r.nextInt(10000);
  //   final _path = path.text;
  //   final fileName = 'profile$i.jpeg';
  //   File _file = File(_path);

  //   FirebaseStorage _storage = FirebaseStorage.instance;
  //   Reference _ref = _storage.ref().child('profile/$fileName');
  //   UploadTask _upload = _ref.putFile(_file);

  //   final snapshot = await _upload.whenComplete(() {});
  //   final url = await snapshot.ref.getDownloadURL();
  // }
}
