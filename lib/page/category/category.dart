import 'package:flutter/material.dart';
import 'package:storeapp/page/category/widget/accessories_categ.dart';
import 'package:storeapp/page/category/widget/bags_categ.dart';
import 'package:storeapp/page/category/widget/beauty_categ.dart';
import 'package:storeapp/page/category/widget/electro_categ.dart';
import 'package:storeapp/page/category/widget/home_garden_categ.dart';
import 'package:storeapp/page/category/widget/kids_categ.dart';
import 'package:storeapp/page/category/widget/men_categ.dart';
import 'package:storeapp/page/category/widget/shoes_categ.dart';
import 'package:storeapp/page/category/widget/women_categ.dart';
import 'package:storeapp/widgets/fake_search_widget.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    setState(() {
      for (var element in items) {
        element.isSelected = false;
      }
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearchWidget(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size))
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: InkWell(
                onTap: () {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.bounceIn);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: items[index].isSelected == true
                          ? Colors.blue // Màu border khi được chọn
                          : Colors
                              .transparent, // Không có border khi không được chọn
                      width: 2.0,
                    ),
                    color: items[index].isSelected == true
                        ? Colors.white
                        : Colors.grey.shade300,
                  ),
                  height: 100,
                  child: Center(
                    child: Text(
                      items[index].label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: items[index].isSelected == true
                            ? Colors.black // Màu chữ khi được chọn
                            : Colors
                                .grey.shade800, // Màu chữ khi không được chọn
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            for (var element in items) {
              element.isSelected = false;
            }
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeGardenCategory(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
