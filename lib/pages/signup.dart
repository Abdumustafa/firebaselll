import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasel/components/custombuttonauth.dart';
import 'package:firebasel/components/customlogoauth.dart';
import 'package:firebasel/components/textformfield.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              CustomTextForm(hinttext: "UserName", mycontroller: username),
              const SizedBox(
                height: 50,
              ),
              CustomTextForm(hinttext: "Email", mycontroller: email),
              const SizedBox(
                height: 50,
              ),
              CustomTextForm(hinttext: "Password", mycontroller: password),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonAuth(
                title: "Sign in ",
                onPressed: () async {
                  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text,
    password: password.text,
  );
  Navigator.of(context).pushReplacementNamed("homepage");
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
                },
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed("login");
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child:
                  Align(alignment: Alignment.centerRight, child: Text("login")),
            ),
          ),
        ]),
      ),
    );
  }
}
