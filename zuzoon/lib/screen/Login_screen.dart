import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zuzoon/screen/ForgetPassword_screen.dart';
import 'package:zuzoon/model/Routes.dart';

import 'Home_screen.dart';
import 'Register_screen.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // Future<Null> signInWithGoogle() async {
  //   GoogleSignIn _googleSignIn = GoogleSignIn(
  //     scopes: [
  //       'email',
  //       'https://www.googleapis.com/auth/contacts.readonly',
  //     ],
  //   );

  //   await Firebase.initializeApp().then((value) async {
  //     await _googleSignIn.signIn().then((value) async {
  //       String? name = value?.displayName;
  //       String? email = value?.email;
  //       await value?.authentication.then((value2) async {
  //         AuthCredential gmail_AuthCredential = GoogleAuthProvider.credential(
  //           idToken: value2.idToken,
  //           accessToken: value2.accessToken,
  //         );
  //         await FirebaseAuth.instance
  //             .signInWithCredential(gmail_AuthCredential)
  //             .then((value3) {
  //           String? uid = value3.user?.uid;
  //           print('Email : $email Name : $name Uid = $uid');
  //         });
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
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
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      //welcome!
                      Row(
                        children: [
                          SizedBox(width: 40),
                          Text(
                            'Welcome!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                                color: Colors.deepPurple[400]),
                          ),
                        ],
                      ),

                      //Sing to countinue
                      Row(
                        children: [
                          SizedBox(width: 45),
                          Text(
                            'Sign in to continue',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.deepPurple[300]),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),

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
                                    errorText: "Plese insert your Email."),
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
                      SizedBox(height: 10),
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
                                    errorText: "Plese insert your Password."),
                                MinLengthValidator(6,
                                    errorText:
                                        'Password must be at least 6 digits long.'),
                              ]),
                              obscureText: true,
                              onSaved: (value) {
                                _passwordController.text = value!;
                              },
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
                      SizedBox(height: 10),
                      //forget pw
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: (() {
                              Navigator.pushNamed(context, '/forgetpass');
                            }),
                            child: Text(
                              'Forget Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.teal[400]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //login btm
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState?.save();
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text)
                                    .then((value) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Welcome back!\nCan't wait to See you soon.",
                                      gravity: ToastGravity.TOP);
                                  Navigator.pushReplacementNamed(
                                      context, '/homepage');
                                });
                              } on FirebaseAuthException catch (e) {
                                print(e.code);
                                String? noti;
                                if (e.code == 'wrong-password') {
                                  noti = 'Wrong password.';
                                }
                                if (e.code == 'user-not-found') {
                                  noti = 'User account not found.';
                                }
                                Fluttertoast.showToast(
                                    msg: noti!, gravity: ToastGravity.CENTER);
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
                                'Login',
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
                        height: 15,
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
                      //   height: 15,
                      // ),

                      // //google btm
                      // SignInButton(
                      //   Buttons.Google,
                      //   text: ('Sign in with Google'),
                      //   onPressed: () {
                      //     signInWithGoogle();
                      //   },
                      // ),

                      // //facebook btm
                      // SignInButton(Buttons.Facebook,
                      //     text: ('Login with Facebook'), onPressed: () {}),
                      // SizedBox(
                      //   height: 30,
                      // ),

                      //Don't have any account?
                      //sign up
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have any account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey[600]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.teal[400]),
                              ),
                            ),
                          ]),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
                  ),
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
}
