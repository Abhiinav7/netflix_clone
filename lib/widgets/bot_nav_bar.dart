import 'package:flutter/material.dart';
import '../view/Screens/feedscreen.dart';
import '../view/Screens/homescreen.dart';
import '../view/Screens/searchscreen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            color: Colors.black,
            height: 70,
            child: const TabBar(
              tabs: [
                Tab(
                  text: "Home",
                  icon: Icon(Icons.home),
                ),
                Tab(
                  text: "Search",
                  icon: Icon(Icons.search),
                ),
                Tab(
                  text: "New & Hot",
                  icon: Icon(Icons.photo_library_outlined),
                ),
              ],
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xff999999),
            ),
          ),
          body: TabBarView(
            children: [
              HomeScreen(),
              SearchScreen(),
              NewHotScreen()
            ],
          ),
        )
    );
  }
}
