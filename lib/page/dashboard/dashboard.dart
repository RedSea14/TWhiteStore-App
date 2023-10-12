import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/page/dashboard/dashboard_components/edit_business.dart';
import 'package:storeapp/page/dashboard/dashboard_components/manage_products.dart';
import 'package:storeapp/page/dashboard/dashboard_components/my_store.dart';
import 'package:storeapp/page/dashboard/dashboard_components/supplier_balance.dart';
import 'package:storeapp/page/dashboard/dashboard_components/supplier_orders.dart';
import 'package:storeapp/page/dashboard/dashboard_components/supplier_statics.dart';
import 'package:storeapp/widgets/alert_dialog.dart';
import 'package:storeapp/widgets/appbar_widgets.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart
];

List<Widget> dashboardPage = [
  const MyStore(),
  const SupplierOrders(),
  const EditBusiness(),
  const ManageProducts(),
  const Balance(),
  const Statics(),
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppbarTitle(title: 'Dash Board'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              MyAlertDialog.showMyDialog(
                context: context,
                title: 'Đăng Xuất',
                content: 'Bạn có muốn đăng xuất?',
                tabNo: () => Navigator.pop(context),
                tabYes: () async {
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/welcome_screen');
                },
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
        ),
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dashboardPage[index],
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    size: 50,
                    color: Colors.yellowAccent,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    label[index].toUpperCase(),
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        fontFamily: 'Acme'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
