import 'package:flutter/material.dart';
import 'package:project1/pages/get_token.dart';
import 'package:project1/pages/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignUpPage(),
      routes: {
        SignUpPage.id:(context)=> const SignUpPage(),
        VerificationPage.id:(context)=> const VerificationPage(),
      },
    );
  }
}


