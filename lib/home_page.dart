import 'package:flutter/material.dart';
import 'package:temp/constans/screen_size.dart';
import 'package:temp/screens/feed_screen.dart';
import 'package:temp/screens/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'add',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.healing),
      label: 'healing',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'account',
    ),
  ];

  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const FeedScreen(),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selectedIndex,
        onTap: _onBtnItemClick,
      ),
    );
  }

  void _onBtnItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
