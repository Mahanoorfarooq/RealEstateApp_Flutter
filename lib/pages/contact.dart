import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/pages/login_signup.dart';
import 'package:real_estate/theme/color.dart';

class ContactPage extends StatefulWidget {
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
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
                  height: h * 0.6,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/contactus.jpg',
                      fit: BoxFit.cover,
                      height: h * 0.6,
                      width: w,
                    ),
                  ),
                ),
                Container(
                  height: h * 0.4,
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
                        controller: _messageController,
                        text: 'Message...',
                        icon: Icons.message,
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
                          String message = _messageController.text;
                          CollectionReference collRef = FirebaseFirestore
                              .instance
                              .collection("signup_db");
                          try {
                            await collRef.add({
                              'username': username,
                              'email': email,
                              'message': message,
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Saving data....")),
                            );

                            // Clear the fields
                            _usernameController.clear();
                            _emailController.clear();
                            _messageController.clear();

                            // Show dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Submission Successful"),
                                  content: Text(
                                      "Thanks for contacting us, we will get back to you soon."),
                                  actions: [
                                    TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } catch (e) {
                            print('Error: $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Failed to save data")),
                            );
                          }
                        },
                        child: Text("Submit"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
