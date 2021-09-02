import 'package:flutter/material.dart';
import 'package:shop_flutter/constants/app_icons.dart';
import 'package:shop_flutter/screens/cart.dart';
import 'package:shop_flutter/screens/feeds.dart';
import 'package:shop_flutter/screens/home.dart';
import 'package:shop_flutter/screens/search.dart';
import 'package:shop_flutter/screens/user_info.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List _pages = [
  //   HomeScreen(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen(),
  // ];

  late List<Map<String, dynamic>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home Screen'},
      {'page': FeedsScreen(), 'title': 'Feeds screen'},
      {'page': SearchScreen(), 'title': 'Search Screen'},
      {'page': CartScreen(), 'title': 'Cart Screen'},
      {'page': UserInfoScreen(), 'title': 'User Screen'}
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          notchMargin: 3,
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          shape: CircularNotchedRectangle(),
          child: Container(
            // height: kBottomNavigationBarHeight * 0.8,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectedPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: TextSelectionTheme.of(context).selectionColor,
              // selectedItemColor: Colors.deepPurple,
              currentIndex: _selectedIndex,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.home),
                  tooltip: 'Home',
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.feeds),
                  tooltip: 'Feeds',
                  label: 'Feeds',
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null), // Icon(
                  //   Icons.search,
                  //   color: Colors.transparent,
                  // ),
                  tooltip: 'Search',
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.cart),
                  tooltip: 'Cart',
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.user),
                  tooltip: 'User',
                  label: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.deepPurple,
        tooltip: 'Search',
        elevation: 5,
        child: (Icon(Icons.search)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
