import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:zuzoon/model/User_data.dart';
import 'package:zuzoon/screen/Login_screen.dart';
import 'Home_screen.dart';
import 'package:intl/intl.dart';

class register_page extends StatefulWidget {
  const register_page({Key? key}) : super(key: key);

  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _confirmPassController = new TextEditingController();
  final _firstNameController = new TextEditingController();
  final _lastNameController = new TextEditingController();
  final _usernameController = new TextEditingController();
  final _dateOfBirthController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  final Future<FirebaseApp> _firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text('error'),
              ),
              body: Center(
                child: Text('${snapshot.error}'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              body: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  child: SafeArea(
                      child: Column(
                    children: [
                      SizedBox(height: 20),
                      //icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.face_rounded,
                            color: Colors.deepPurple[400],
                            size: 100,
                          ),
                          SizedBox(
                            width: 15,
                          ),

                          //Hi!
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Hi!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.deepPurple[400]),
                                  ),
                                ],
                              ),
                              //Create a new account
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create a new account',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.deepPurple[400]),
                                  ),
                                ],
                              ),
                              //Already have an account?
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        color: Colors.deepPurple[300]),
                                  ),
                                  //login
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.teal[400]),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),

                      //first name field
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("First name has required.");
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'First Name',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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

                      //last name field
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Last name has required.");
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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

                      //date of birth field
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
                                    firstDate:
                                        DateTime(DateTime.now().year - 80),
                                    lastDate: DateTime.now());
                                if (_pickedDate != null) {
                                  setState(() {
                                    _dateOfBirthController.text =
                                        DateFormat('d/M/yyy')
                                            .format(_pickedDate);
                                  });
                                }
                              },
                              readOnly: true,
                              controller: _dateOfBirthController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.today_rounded),
                                border: InputBorder.none,
                                labelText: 'Date of Birth',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Birth day has required.");
                                }
                              },
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //username field
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
                                if (value!.isEmpty) {
                                  return ("Username has required.");
                                }
                                if (!regExp.hasMatch(value)) {
                                  return ("Username must be at least 6 characters.");
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Username',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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

                      //email field
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
                              controller: _emailController,
                              validator: MultiValidator([
                                EmailValidator(
                                    errorText: "Invalid email format."),
                                RequiredValidator(
                                    errorText: "Email has required."),
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {
                                _emailController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Email',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //password field
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
                              controller: _passwordController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "Password has required."),
                                MinLengthValidator(6,
                                    errorText:
                                        'Password must be at least 6 digits long.'),
                              ]),
                              obscureText: true,
                              onSaved: (value) {
                                _passwordController.text = value!;
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      //Confirm pass field
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
                              controller: _confirmPassController,
                              validator: (value) {
                                if (_passwordController.text != value) {
                                  return "Password don't match.";
                                }
                                if (value!.isEmpty) {
                                  return ("Cannot be empty.");
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Confirm Password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                              onSaved: (value) {
                                _confirmPassController.text = value!;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      //create account btm
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState?.save();
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) {
                                  postDeailsToFirestore();

                                  Fluttertoast.showToast(
                                      msg: "User account created.",
                                      gravity: ToastGravity.TOP);
                                  Navigator.pushReplacementNamed(
                                      context, '/homepage');
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message!,
                                    gravity: ToastGravity.CENTER);
                              }
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
                                'Create Account',
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
                        height: 10,
                      ),

                      // //or
                      // Center(
                      //   child: Text(
                      //     'or',
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 20,
                      //         color: Colors.grey[600]),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),

                      // //google btm
                      // SignInButton(
                      //   Buttons.Google,
                      //   text: ('Sign in with Google'),
                      //   onPressed: () {},
                      // ),

                      // //facebook btm
                      // SignInButton(Buttons.Facebook,
                      //     text: ('Login with Facebook'), onPressed: () {}),
                      // SizedBox(
                      //   height: 30,
                      // ),
                    ],
                  )),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  FirebaseFirestore firebaseFirestone = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  User_data user_data = User_data();
  postDeailsToFirestore() async {
    //calling uor firestone
    //calling our user modle
    //sending these value

    //writng all the value
    user_data.email = user?.email;
    user_data.uid = user?.uid;
    user_data.firstName = _firstNameController.text;
    user_data.lastName = _lastNameController.text;
    user_data.username = _usernameController.text;
    user_data.birthday = _dateOfBirthController.text;
    user_data.pic = 'ZUZoon_logo.png';

    print(
        '${user_data.email}\n ${user_data.uid}\n ${user_data.firstName}\n${user_data.lastName}\n${user_data.username}\n${user_data.birthday}');

    await firebaseFirestone
        .collection("user")
        .doc(user?.uid)
        .set(user_data.toMap());
    await addEvent(user_data.uid);
    addCommu(user_data.uid);
  }

  Future<String?> addEvent([String? uid]) async {
    CollectionReference user = firebaseFirestone.collection('user');
    user.doc(user_data.uid).collection('eventList').add({
      '_count': 0,
    });
  }

  Future<String?> addCommu([String? uid]) async {
    CollectionReference user = firebaseFirestone.collection('user');
    user.doc(user_data.uid).collection('commuList').add({
      '_count': 0,
    });
  }
}
