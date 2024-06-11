import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
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
                      'assets/images/about.png',
                      fit: BoxFit.cover,
                      height: h * 0.6,
                      width: w,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  height: h * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We are a leading real estate company committed to providing '
                        'exceptional services to our clients. Our team of experienced '
                        'professionals is dedicated to helping you find the perfect property '
                        'that meets your needs and budget. Whether you are looking to buy, sell, '
                        'or rent, we offer a comprehensive range of services to make your real '
                        'estate journey smooth and hassle-free.'
                        'Thank you for choosing us as your trusted real estate partner.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                        ),
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
