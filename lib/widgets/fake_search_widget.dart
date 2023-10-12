import 'package:flutter/material.dart';
import 'package:storeapp/minor_screen/search.dart';

class FakeSearchWidget extends StatelessWidget {
  const FakeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 35,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.blue, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Bạn muốn tìm gì?',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
