import 'package:flutter/material.dart';
import 'package:storeapp/page/main_screen/customer/customer_home.dart';
import 'package:storeapp/widgets/appbar_widgets.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({super.key, this.back});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const AppbarTitle(title: 'Cart'),
            elevation: 0,
            actions: const [
              Icon(
                Icons.delete_forever,
                color: Colors.black,
              )
            ],
            leading: widget.back,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Your Cart Is Empty!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                  child: MaterialButton(
                    minWidth: MediaQuery.sizeOf(context).width * 0.6,
                    onPressed: () {
                      Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CustomerHomeScreen(),
                              ));
                    },
                    child: const Text('coutinue shopping'),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Total: \$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                          text: '00.00',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                    ],
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue,
                  child: MaterialButton(
                    minWidth: MediaQuery.sizeOf(context).width * 0.45,
                    onPressed: () {},
                    child: const Text(
                      'Check Out',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
