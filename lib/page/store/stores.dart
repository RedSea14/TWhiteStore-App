import 'package:flutter/material.dart';
import 'package:storeapp/widgets/appbar_widgets.dart';

class StoresScreen extends StatelessWidget {
  const StoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const AppbarTitle(title: 'Stores'),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
