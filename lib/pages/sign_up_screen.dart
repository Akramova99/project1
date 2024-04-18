import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1/model/registration_request.dart';
import 'package:project1/server/auth_service.dart';

import 'get_token.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkRegistration();
  }
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  checkRegistration() {
    String name = nameController.text.trim();
    String surname = surnameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String photoId = '';
    String signature = '';
    if (name.isNotEmpty &&
        surname.isNotEmpty &&
        phone.isNotEmpty &&
        password.isNotEmpty) {
      AuthModel user = AuthModel(
          name: name,
          surname: surname,
          password: password,
          phone: phone,
          photoId: photoId,
          signature: signature);
      AuthService.registration(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: nameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Membername",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Name"),
              ),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.only(left: 25, bottom: 15, right: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                controller: surnameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Surname",
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: "Surname"),
              ),
            ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextField(
              controller: phoneController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.phone),
                  border: InputBorder.none,
                  hintText: "Phone",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Phone number"),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.only(left: 25, bottom: 15, right: 25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextField(
              controller: passwordController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Password"),
            ),
          ),
          GestureDetector(

            onTap: () {
              //Navigator.pushReplacementNamed(context, HomePage.id);
              checkRegistration();
              Navigator.pushReplacementNamed(context, VerificationPage.id);
            },
            child: Container(
              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFFFF2F00),
                    Color(0xFFFF3F00),
                    Color(0xFFFF4F00),
                    Color(0xFFFF5F00),
                    Color(0xFFFF6F00),
                    Color(0xFFFF7F00),
                    Color(0xFFFF8F00),
                    Color(0xFFFFA000),
                    Color(0xFFFF8F00),
                  ],
                ),
              ),
              child: const Center(
                  child: Text(
                "Create New Account",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
