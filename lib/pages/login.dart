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
                  "login",
                  style: TextStyle(fontSize: 50),
                ),
              ),
              const SizedBox(
                height: 100,
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
                title: "login",
                onPressed: () {},
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
