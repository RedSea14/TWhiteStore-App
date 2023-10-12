import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/page/cart/cart.dart';
import 'package:storeapp/page/customer_screen/customer_orders.dart';
import 'package:storeapp/page/customer_screen/wishlist.dart';
import 'package:storeapp/page/profile/widget/button_profile.dart';
import 'package:storeapp/page/profile/widget/list_tile.dart';
import 'package:storeapp/widgets/alert_dialog.dart';
import 'package:storeapp/widgets/appbar_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.documentId});
  final String documentId;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('customers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  expandedHeight: 140,
                  // Increase the expanded height
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        centerTitle: true,
                        title: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: constraints.biggest.height <= 120 ? 1 : 0,
                          child: const Text(
                            'Account',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        background: Container(
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              data['profileImage'] == ''
                                  ? const CircleAvatar(
                                      radius: 50,
                                      backgroundImage: AssetImage(
                                          'assets/images/inapp/guest.jpg'),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          NetworkImage(data['profileImage']),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                data['name'] == ''
                                    ? 'guest'.toUpperCase()
                                    : data['name'].toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            // Thay đổi màu nền
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceAround, // Canh giữa các button
                          children: [
                            ButtonProflie(
                              nameButton: 'Cart',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(
                                        back: AppbarBackButton(),
                                      ),
                                    ));
                              },
                              icon: Icons.shopping_cart,
                            ),
                            ButtonProflie(
                              nameButton: 'Order',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomerOrders(),
                                    ));
                              },
                              icon: Icons.shopping_bag,
                            ),
                            ButtonProflie(
                              nameButton: 'Wish',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Wishlist(),
                                    ));
                              },
                              icon: Icons.favorite,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Account Info',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                icon: Icons.email,
                                subTilte: data['email'] == ''
                                    ? 'example@email.com'
                                    : data['email'],
                                title: 'Email Address',
                                onPressed: () {},
                              ),
                              RepeatedListTile(
                                icon: Icons.phone,
                                subTilte: data['phone'] == ''
                                    ? 'example: +11111'
                                    : data['phone'],
                                title: 'Phone No.',
                                onPressed: () {},
                              ),
                              RepeatedListTile(
                                icon: Icons.location_pin,
                                subTilte: data['address'] == ''
                                    ? 'example : New Gersy - usa'
                                    : data['address'],
                                title: 'Address',
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.28,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              RepeatedListTile(
                                title: 'Edit profile',
                                subTilte: '',
                                icon: Icons.edit,
                                onPressed: () {},
                              ),
                              RepeatedListTile(
                                title: 'Change Password',
                                subTilte: '',
                                icon: Icons.security,
                                onPressed: () {},
                              ),
                              RepeatedListTile(
                                title: 'Log Out',
                                subTilte: '',
                                icon: Icons.logout,
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
                                      Navigator.pushReplacementNamed(
                                          context, '/welcome_screen');
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.purple,
          ),
        );
      },
    );
  }
}
