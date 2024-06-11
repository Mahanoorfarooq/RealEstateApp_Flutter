import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/widgets/bottombar_item.dart';
import 'package:real_estate/widgets/custom_textbox.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _activeTab = 3;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
    },
    {
      "icon": Icons.message,
      "active_icon": Icons.message_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBgColor,
        title: _buildHeader(),
      ),
      body: CustomScrollView(
        slivers: <Widget>[SliverToBoxAdapter(child: _buildBody())],
      ),
      floatingActionButton: _buildBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: CustomTextBox(
            hint: "Search",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          _buildChatMessages(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildChatMessages() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildListTile(
            image: "assets/images/avatar1.jpg",
            name: "Shahid Islam",
            subtitle: "Hello, How are you?",
            trailing: "3:00 PM",
          ),
          SizedBox(height: 20),
          _buildListTile(
            image: "assets/images/avatar2.png",
            name: "Noman Qureshi",
            subtitle: "Thank you!",
            trailing: "12:00 PM",
          ),
          SizedBox(height: 20),
          _buildListTile(
            image: "assets/images/avatar4.jpg",
            name: "Muhammad Mehdi",
            subtitle: "Check that Property..",
            trailing: "2:00 PM",
          ),
          SizedBox(height: 20),
          _buildListTile(
            image: "assets/images/avatar3.png",
            name: "Shahzad Aslam",
            subtitle: "Let's plan a meetup.",
            trailing: "5:15 PM",
          ),
          SizedBox(height: 20),
          _buildListTile(
            image: "assets/images/avatar1.jpg",
            name: "Ahmed",
            subtitle: "How can I help you?",
            trailing: "1:00 PM",
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String image,
    required String name,
    required String subtitle,
    required String trailing,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            spreadRadius: .5,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        title: Text(name),
        subtitle: Text(subtitle),
        trailing: Text(trailing),
        onTap: () {
          _launchWhatsApp();
        },
      ),
    );
  }

  Future<void> _launchWhatsApp() async {
    final String phoneNumber = '+923000000000';
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

  Widget _buildBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColor.bottomBarColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowColor.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          _barItems.length,
          (index) => BottomBarItem(
            _activeTab == index
                ? _barItems[index]["active_icon"]
                : _barItems[index]["icon"],
            isActive: _activeTab == index,
            activeColor: AppColor.primary,
            onTap: () {
              setState(() {
                _activeTab = index;
              });
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/explore');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/favorite');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/chat');
                  break;
              }
            },
          ),
        ),
      ),
    );
  }
}
