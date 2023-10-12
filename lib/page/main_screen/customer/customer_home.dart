import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:storeapp/page/cart/cart.dart';
import 'package:storeapp/page/category/category.dart';
import 'package:storeapp/page/main_screen/home.dart';
import 'package:storeapp/page/profile/profile.dart';
import 'package:storeapp/page/store/stores.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const StoresScreen(),
    const CartScreen(),
    ProfileScreen(
      documentId: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectIndex,
        selectedItemColor: const Color.fromARGB(255, 61, 49, 11),
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Category'),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shop),
            title: const Text('Stores'),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            selectedColor: Colors.teal,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Profile'),
            selectedColor: Colors.blue,
          ),
        ],
        onTap: (value) {
          setState(() {
            _selectIndex = value;
          });
        },
      ),
    );
  }
}
