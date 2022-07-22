import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'Login_screen.dart';

class forgetPassword_page extends StatefulWidget {
  const forgetPassword_page({Key? key}) : super(key: key);

  @override
  State<forgetPassword_page> createState() => _forgetPassword_pageState();
}

class _forgetPassword_pageState extends State<forgetPassword_page> {
  final _emailController = new TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordRest() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim())
          .then((value) {
        Fluttertoast.showToast(
            msg: "Password reset link sent!\nCheck your email",
            gravity: ToastGravity.TOP);
        Navigator.pushReplacementNamed(context, '\login');
      });
    } on FirebaseException catch (e) {
      print(e);
      String? noti;

      if (e.code == 'user-not-found') {
        noti = 'User account not found.';
      }
      if (e.message == 'Given String is empty or null') {
        noti = 'Plese insert your Email.';
      }
      if (e.code == 'invalid-email') {
        noti = 'Invalid email format.';
      }
      Fluttertoast.showToast(msg: noti!, gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        child: SingleChildScrollView(
            child: SafeArea(
          child: Column(children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.teal[300],
              ),
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
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 160,
            ),
            //text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Enter your email and we will send you a password reset link',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Colors.grey[600]),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                          EmailValidator(errorText: "Invalid email format."),
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
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                //reset btm
                MaterialButton(
                  onPressed: passwordRest,
                  color: Colors.deepPurple[300],
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey[200],
                    ),
                  ),
                )
              ],
            ),
          ]),
        )),
      ),
    );
  }
}
