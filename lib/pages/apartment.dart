import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/pages/appdrawer.dart';

import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/bottombar_item.dart';
import 'package:real_estate/widgets/category_item.dart';

import 'package:real_estate/widgets/custom_image.dart';

import 'package:real_estate/pages/propertydetail.dart';

import 'package:real_estate/widgets/property_item.dart';

class ApartmentPage extends StatefulWidget {
  const ApartmentPage({Key? key}) : super(key: key);

  @override
  _ApartmentPageState createState() => _ApartmentPageState();
}

class _ApartmentPageState extends State<ApartmentPage> {
  int _activeTab = 0;
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appBgColor,
          title: _buildHeader(),
        ),
        drawer: AppDrawer(),
        body: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[SliverToBoxAdapter(child: _buildBody())],
            ),
          ],
        ),
        floatingActionButton: _buildBottomBar(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apartments",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Find The Perfect Place",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            CustomImage(
              profile,
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          _buildCategories(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: AppColor.darker),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildHome(),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildHome2(),
          const SizedBox(
            height: 100,
          ),
          // IndexedStack(
          //   index: _activeTab,
          //   children: List.generate(
          //     _barItems.length,
          //     (index) => _barItems[index]["page"],
          //   ),
          // ),
        ],
      ),
    );
  }

  int _selectedCategory = 2;
  Widget _buildCategories() {
    List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/house');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/apartment');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/building');
          } else {
            Navigator.pushNamed(context, '/flat');
          }
        },
      ),
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildHome() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        apartment.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PropertyDetailPage(property: apartment[index]),
              ),
            );
          },
          child: PropertyItem(
            data: apartment[index],
            onFavoriteChanged: (isFavorite) {
              setState(() {
                apartment[index]["is_favorited"] = isFavorite;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHome2() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        apartment2.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PropertyDetailPage(property: apartment2[index]),
              ),
            );
          },
          child: PropertyItem(
            data: apartment2[index],
            onFavoriteChanged: (isFavorite) {
              setState(() {
                apartment2[index]["is_favorited"] = isFavorite;
              });
            },
          ),
        ),
      ),
    );
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
              if (index == 0) {
                _activeTab;
                Navigator.pushNamed(context, '/home');
              } else if (index == 1) {
                Navigator.pushNamed(context, '/explore');
              } else if (index == 2) {
                _activeTab;
                Navigator.pushNamed(context, '/favorite');
              } else {
                _activeTab;
                Navigator.pushNamed(context, '/chat');
              }
            },
          ),
        ),
      ),
    );
  }
}
