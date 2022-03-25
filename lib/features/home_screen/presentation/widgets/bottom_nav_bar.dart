import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_line/features/detail_screen/screens/detail_screen.dart';
import 'package:movie_line/features/discover_screen/screens/discover_movies.dart';
import 'package:movie_line/features/discover_screen/screens/discover_tv.dart';
import 'package:movie_line/features/home_screen/presentation/screens/home_screen.dart';
import 'package:movie_line/utils/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> _pages = <Widget>[
    HomeScreen(),
    DiscoverMovies(),
    DiscoverTv(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color.fromRGBO(218, 218, 218, 0.2),
        backgroundColor: bgColor,
        iconSize: 30,
        selectedItemColor: Color.fromRGBO(255, 143, 113, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(home),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(playIcon),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(person),
              ),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
