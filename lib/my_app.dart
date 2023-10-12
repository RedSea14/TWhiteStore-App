import 'package:flutter/material.dart';
import 'package:storeapp/page/auth/customer_login.dart';
import 'package:storeapp/page/auth/customer_signup.dart';
import 'package:storeapp/page/auth/supplier_login.dart';
import 'package:storeapp/page/auth/supplier_signup.dart';
import 'package:storeapp/page/main_screen/customer/customer_home.dart';
import 'package:storeapp/page/main_screen/supplier/supplier_home.dart';
import 'package:storeapp/page/welcome/welcome.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home': (context) => const CustomerHomeScreen(),
        '/supplier_home': (context) => const SupplierHomeScreen(),
        '/customer_signup': (context) => const CustomerSignUpScreen(),
        '/customer_login': (context) => const CustomerLoginScreen(),
        '/supplier_signup': (context) => const SupplierSignUpScreen(),
        '/supplier_login': (context) => const SupplierLoginScreen(),
      },
    );
  }
}
