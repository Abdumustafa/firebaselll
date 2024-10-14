import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasel/firebase_options.dart';
import 'package:firebasel/pages/homepage.dart';
import 'package:firebasel/pages/login.dart';
import 'package:firebasel/pages/signup.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('----------------------User is currently signed out!');
      } else {
        print('----------------------User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser==null? Login():Homepage(),
      routes: {
        "signup": (context) => const SignUp(),
        "login": (context) => const Login(),
         "homepage": (context) => const Homepage(),
      },
    );
  }
}
