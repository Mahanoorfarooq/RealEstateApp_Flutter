import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/widgets/custom_image.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailPage extends StatelessWidget {
  final Map property;

  PropertyDetailPage({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property['name']),
        backgroundColor: AppColor.appBgColor,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomImage(
                property['image'],
                width: double.infinity,
                height: 200,
                radius: 15,
              ),
              SizedBox(height: 15),
              Text(
                property['name'],
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                property['location'],
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                '${property['price']}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                property['description'] ?? 'No description available',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Contact with the Broker-Agent",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: AppColor.blue,
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      _launchWhatsApp(context);
                    },
                    child: Text("Contact"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchWhatsApp(BuildContext context) async {
    final String phoneNumber = '+92300000000'; //Add number here
    final String message = Uri.encodeComponent(
        "Hello Mam! I need your assistance...Could you please help me to contact with Noman Qureshi? I am waiting for your response...Regards, John Doe");
    final String url = 'https://wa.me/$phoneNumber?text=$message';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch WhatsApp'),
        ),
      );
      throw 'Could not launch $url';
    }
  }
}
