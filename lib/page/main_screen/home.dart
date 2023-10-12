import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/minor_screen/search.dart';
import 'package:storeapp/widgets/fake_search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              RepeatedTab(label: 'Men'),
              RepeatedTab(label: 'Women'),
              RepeatedTab(label: 'Shoes'),
              RepeatedTab(label: 'Bags'),
              RepeatedTab(label: 'Electronics'),
              RepeatedTab(label: 'Accessories'),
              RepeatedTab(label: 'Home & Garden'),
              RepeatedTab(label: 'Kids'),
              RepeatedTab(label: 'Beauty'),
            ],
            isScrollable: true,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearchWidget(),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Men')),
            Center(child: Text('Women')),
            Center(child: Text('Shoes')),
            Center(child: Text('Bags')),
            Center(child: Text('Electronics')),
            Center(child: Text('Accessories')),
            Center(child: Text('Home & Garden')),
            Center(child: Text('Kids')),
            Center(child: Text('Beauty')),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  RepeatedTab({super.key, required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
