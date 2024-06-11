import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/pages/firebase_auth.dart';

import 'package:real_estate/theme/color.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: h * 0.42,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/signup.jpg',
                        fit: BoxFit.cover,
                        height: h * 0.42,
                        width: w,
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.58,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        FormWidget(
                          text: 'Full Name',
                          icon: Icons.verified_user,
                          controller: _usernameController,
                        ),
                        FormWidget(
                          controller: _emailController,
                          text: 'Email ID',
                          icon: Icons.email,
                        ),
                        FormWidget(
                          controller: _passwordController,
                          text: 'Password',
                          icon: Icons.password,
                        ),
                        FormWidget(
                          controller: _confirmPasswordController,
                          text: 'Confirm Password',
                          icon: Icons.password,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColor.blue,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () async {
                            String username = _usernameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            CollectionReference collRef = FirebaseFirestore
                                .instance
                                .collection("signup_db");
                            try {
                              await collRef.add({
                                'username': username,
                                'email': email,
                                'password': password,
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Saving data....")),
                              );
                              Navigator.pushNamed(context, '/login');
                            } catch (e) {
                              print('Error: $e');
                            }
                          },
                          child: Text("Sign Up"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have an Account?",
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class UserData {
  static String? username;
  static String? email;
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: h * 0.45,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/signup.jpg',
                        fit: BoxFit.cover,
                        height: h * 0.45,
                        width: w,
                      ),
                    ),
                  ),
                  Container(
                    height: h * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FormWidget(
                          controller: _emailController,
                          text: 'Username',
                          icon: Icons.email,
                        ),
                        FormWidget(
                          controller: _passwordController,
                          text: 'Password',
                          icon: Icons.password,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColor.blue,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () async {
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            CollectionReference collRef = FirebaseFirestore
                                .instance
                                .collection("signup_db");
                            try {
                              QuerySnapshot<Map<String, dynamic>> snapshot =
                                  await FirebaseFirestore.instance
                                      .collection("signup_db")
                                      .where("email", isEqualTo: email)
                                      .limit(1)
                                      .get();

                              if (snapshot.docs.isNotEmpty) {
                                DocumentSnapshot<Map<String, dynamic>> userDoc =
                                    snapshot.docs.first;
                                String storedPassword = userDoc["password"];
                                String storedUsername = userDoc["username"];
                                String storedEmail = userDoc["email"];
                                setState(() {
                                  UserData.username = storedUsername;
                                  UserData.email = storedEmail;
                                });

                                if (storedPassword == password) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Logged in'),
                                      duration: Duration(seconds: 1),
                                    ),
                                  );

                                  Navigator.pushNamed(context, "/home");
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Incorrect email/password'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Error during login: $e'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Text("Login"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account?"),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/signup');
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColor.blue,
                            textStyle: TextStyle(
                              fontSize: 15,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 100),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/home');
                          },
                          child: Text("Skip"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class FormWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;

  FormWidget(
      {required this.icon, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.blue),
        ),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                prefixIcon: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    icon,
                    color: AppColor.blue,
                  ),
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ));
  }
}
