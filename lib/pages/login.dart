import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasel/components/custombuttonauth.dart';
import 'package:firebasel/components/textformfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(children: [
          Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomTextForm(
                  hinttext: "Email",
                  mycontroller: email,
                  validator: (val) {
                    if (val == "") {
                      return "Can't to be Empty";
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextForm(
                    hinttext: "Password",
                    mycontroller: password,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to be Empty";
                      }
                    },),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("signup");
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forget Password")),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonAuth(
                title: "login",
                onPressed: () async {
                  if (formState.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      Navigator.of(context).pushReplacementNamed("homepage");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'No user found for that email.',
                        ).show();
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'Wrong password provided for that user.',
                        ).show();
                      }
                    }
                  } else {
                    print("not valid");
                  }
                },
              ),
              const SizedBox(
                width: 50,
              ),
              CustomButtonAuth(
                title: "login with google",
                onPressed: () {},
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("signup");
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                  alignment: Alignment.centerRight, child: Text("Register")),
            ),
          ),
        ]),
      ),
    );
  }
}
