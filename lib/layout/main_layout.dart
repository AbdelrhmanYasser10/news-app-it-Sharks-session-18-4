import 'package:flutter/material.dart';
import 'package:untitled10/screens/category_screen.dart';
import 'package:untitled10/screens/home_screen.dart';
import 'package:untitled10/screens/search_screen.dart';
import 'package:untitled10/shared/style/textstyle.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIdx = 0;
  List<Widget> screens = const [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: AppTextStyle.labelStyle(),
        unselectedLabelStyle: AppTextStyle.labelStyle(),
        onTap: (value) {
          setState(() {
            currentIdx = value;
          });
        },
        currentIndex:currentIdx,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: "Category"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search"
          ),
        ],
      ),
      body: screens[currentIdx],
    );
  }
}
