import 'package:cosmatics_app/pages/cart/cart_details.dart';
import 'package:cosmatics_app/pages/home/main_cosmatics_page.dart';
import 'package:cosmatics_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    MainCosmaticPage(),
  CartDetails(),
    Container(child: Text(''))
  ];
  void onNavTap(index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: blueush,
          showUnselectedLabels: false,unselectedItemColor:black.withOpacity(.4),
          selectedLabelStyle:
              TextStyle(fontFamily: 'cairo', fontWeight: FontWeight.w200),
      currentIndex: _selectedIndex,  onTap: onNavTap,  items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'المشتريات'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'حسابك')
          ]),
    );
  }
}
