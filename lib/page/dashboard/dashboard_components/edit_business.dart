import 'package:flutter/material.dart';
import 'package:storeapp/widgets/appbar_widgets.dart';

class EditBusiness extends StatelessWidget {
  const EditBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const AppbarBackButton(),
        title: const AppbarTitle(
          title: 'EditBusiness',
        ),
      ),
    );
  }
}
