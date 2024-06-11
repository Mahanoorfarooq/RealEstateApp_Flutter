import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/bottombar_item.dart';
import 'package:real_estate/widgets/custom_image.dart';
import 'package:real_estate/widgets/property_item.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _activeTab = 2;
  final List _barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "route": '/home',
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "route": '/explore',
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "route": '/favorite',
    },
    {
      "icon": Icons.message,
      "active_icon": Icons.message_outlined,
      "route": '/chat',
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
                  "Welcome to Monoline Properties",
                  style: TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Favorites",
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
          const SizedBox(height: 20),
          _buildFavorites(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFavorites() {
    List allProperties = [
      ...populars,
      ...Homes,
      ...Homes2,
      ...apartment,
      ...apartment2,
      ...flats,
      ...flats2,
      ...building,
      ...building2
    ];
    List favoriteProperties = allProperties
        .where((property) => property['is_favorited'] == true)
        .toList();

    if (favoriteProperties.isEmpty) {
      return Center(
        child: Text(
          "No favorited properties available.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: favoriteProperties.map((property) {
        return PropertyItem(
          data: property,
          onFavoriteChanged: (isFavorited) {
            _toggleFavorite(isFavorited, property);
          },
        );
      }).toList(),
    );
  }

  void _toggleFavorite(bool isFavorited, Map property) {
    setState(() {
      property['is_favorited'] = isFavorited;

      int popularIndex = populars.indexOf(property);
      if (popularIndex != -1) {
        populars[popularIndex]['is_favorited'] = isFavorited;
      }

      int homeIndex = Homes.indexOf(property);
      if (homeIndex != -1) {
        Homes[homeIndex]['is_favorited'] = isFavorited;
      }
      int homeIndex2 = Homes2.indexOf(property);
      if (homeIndex2 != -1) {
        Homes2[homeIndex2]['is_favorited'] = isFavorited;
      }
      int ApartmentIndex = apartment.indexOf(property);
      if (ApartmentIndex != -1) {
        apartment[ApartmentIndex]['is_favorited'] = isFavorited;
      }
      int ApartmentIndex2 = apartment2.indexOf(property);
      if (ApartmentIndex2 != -1) {
        apartment2[ApartmentIndex2]['is_favorited'] = isFavorited;
      }
      int flatIndex = flats.indexOf(property);
      if (flatIndex != -1) {
        flats[flatIndex]['is_favorited'] = isFavorited;
      }
      int flatIndex2 = flats2.indexOf(property);
      if (flatIndex2 != -1) {
        flats2[flatIndex2]['is_favorited'] = isFavorited;
      }
      int buildingIndex2 = building.indexOf(property);
      if (buildingIndex2 != -1) {
        building[buildingIndex2]['is_favorited'] = isFavorited;
      }
      int buildingIndex = building2.indexOf(property);
      if (buildingIndex != -1) {
        building2[buildingIndex]['is_favorited'] = isFavorited;
      }
    });
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
              Navigator.pushNamed(context, _barItems[index]["route"]);
            },
          ),
        ),
      ),
    );
  }
}
