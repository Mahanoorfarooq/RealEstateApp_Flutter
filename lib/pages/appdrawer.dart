import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_estate/pages/Dashboard.dart';
import 'package:real_estate/pages/aboutus.dart';
import 'package:real_estate/pages/contact.dart';
import 'package:real_estate/pages/housePage.dart';
import 'package:real_estate/pages/login_signup.dart';
import 'package:real_estate/theme/color.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Name"),
            accountEmail: Text(
              "xyz@gmail.com",
            ),
            currentAccountPicture: imagePath == null
                ? CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar1.jpg"),
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(File(imagePath!)),
                  ),
          ),
          ListTile(
            leading: Icon(Icons.image, color: AppColor.blue),
            title: Text('Choose Image'),
            onTap: () async {
              await pickImage();
            },
          ),
          ListTile(
            title: Text('Create Account'),
            leading: Icon(Icons.account_box, color: AppColor.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard, color: AppColor.blue),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('About Us'),
            leading: Icon(Icons.details_outlined, color: AppColor.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            title: Text('Contact Us'),
            leading: Icon(Icons.email, color: AppColor.blue),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
      Directory documents = await getApplicationDocumentsDirectory();
      File file = File('${documents.path}/${pickedImage.name}');
      await file.writeAsBytes(await pickedImage.readAsBytes());
    }
  }
}
