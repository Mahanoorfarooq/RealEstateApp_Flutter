import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<Map<String, dynamic>> homes = [
  {
    "id": "1",
    "name": "Single Villa",
    "image": "assets/images/home1.jpg",
    "is_favorited": false,
  },
  {
    "id": "2",
    "name": "Orchard Residence",
    "image": "assets/images/home1.jpg",
    "is_favorited": false,
  },
];

class HousePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HousePage> {
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
  void initState() {
    super.initState();
    _saveData();
  }

  Future<void> _saveData() async {
    CollectionReference homesCollection =
        FirebaseFirestore.instance.collection('signup_db');

    for (Map<String, dynamic> home in homes) {
      try {
        await homesCollection.doc(home['id']).set(home);
        print("Home ${home['name']}");
      } catch (e) {
        print("Failed to add home ${home['name']}: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Homes')),
      body: ListView.builder(
        itemCount: homes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PropertyDetailPage(property: homes[index]),
                ),
              );
            },
            child: PropertyItem(
              data: homes[index],
              onFavoriteChanged: (isFavorite) async {
                setState(() {
                  homes[index]["is_favorited"] = isFavorite;
                });

                CollectionReference collRef =
                    FirebaseFirestore.instance.collection("signup_db");

                try {
                  await collRef.doc(homes[index]["id"]).update({
                    "is_favorited": isFavorite,
                  });
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Failed to update favorite status: $e')),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class PropertyItem extends StatelessWidget {
  final Map<String, dynamic> data;
  final ValueChanged<bool> onFavoriteChanged;

  PropertyItem({required this.data, required this.onFavoriteChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(data['image']),
      title: Text(data['name']),
      trailing: IconButton(
        icon: Icon(
          data['is_favorited'] ? Icons.favorite : Icons.favorite_border,
          color: data['is_favorited'] ? Colors.red : null,
        ),
        onPressed: () {
          onFavoriteChanged(!data['is_favorited']);
        },
      ),
    );
  }
}

class PropertyDetailPage extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyDetailPage({required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(property['name'])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(property['image']),
            SizedBox(height: 20),
            Text(property['name'], style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text(property['is_favorited'] ? 'Favorited' : 'Not Favorited'),
          ],
        ),
      ),
    );
  }
}


// Widget _buildHome2() {
//   return CarouselSlider(
//     options: CarouselOptions(
//       height: 240,
//       enlargeCenterPage: true,
//       disableCenter: true,
//       viewportFraction: .8,
//     ),
//     items: List.generate(
//       populars.length,
//       (index) => GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   PropertyDetailPage(property: Homes2[index]),
//             ),
//           );
//         },
//         child: PropertyItem(
//           data: Homes2[index],
//           onFavoriteChanged: (isFavorite) {
//             setState(() {
//               populars[index]["is_favorited"] = isFavorite;
//             });
//           },
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildBottomBar() {
//   return Container(
//     height: 55,
//     width: double.infinity,
//     margin: EdgeInsets.symmetric(horizontal: 15),
//     decoration: BoxDecoration(
//       color: AppColor.bottomBarColor,
//       borderRadius: BorderRadius.circular(20),
//       boxShadow: [
//         BoxShadow(
//           color: AppColor.shadowColor.withOpacity(0.1),
//           blurRadius: 1,
//           spreadRadius: 1,
//           offset: Offset(0, 1),
//         ),
//       ],
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: List.generate(
//         _barItems.length,
//         (index) => BottomBarItem(
//           _activeTab == index
//               ? _barItems[index]["active_icon"]
//               : _barItems[index]["icon"],
//           isActive: _activeTab == index,
//           activeColor: AppColor.primary,
//           onTap: () {
//             if (index == 0) {
//               Navigator.pushNamed(context, '/home');
//             } else if (index == 1) {
//               Navigator.pushNamed(context, '/explore');
//             } else if (index == 2) {
//               Navigator.pushNamed(context, '/favorite');
//             } else {
//               Navigator.pushNamed(context, '/chat');
//             }
//           },
//         ),
//       ),
//     ),
//   );
// }

// class PropertyItem extends StatelessWidget {
//   final Map<String, dynamic> data;
//   final ValueChanged<bool> onFavoriteChanged;

//   PropertyItem({required this.data, required this.onFavoriteChanged});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.asset(data['image']),
//       title: Text(data['name']),
//       trailing: IconButton(
//         icon: Icon(
//           data['is_favorited'] ? Icons.favorite : Icons.favorite_border,
//           color: data['is_favorited'] ? Colors.red : null,
//         ),
//         onPressed: () {
//           onFavoriteChanged(!data['is_favorited']);
//         },
//       ),
//     );
//   }
// }

// class PropertyDetailPage extends StatelessWidget {
//   final Map<String, dynamic> property;

//   PropertyDetailPage({required this.property});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(property['name'])),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(property['image']),
//             SizedBox(height: 20),
//             Text(property['name'], style: TextStyle(fontSize: 24)),
//             SizedBox(height: 20),
//             Text(property['is_favorited'] ? 'Favorited' : 'Not Favorited'),
//           ],
//         ),
//       ),
//     );
//   }
// }
