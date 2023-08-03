import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/providers/category_provider.dart';
import 'package:techno_mir/providers/products_provider.dart';
import 'package:techno_mir/ui/tab/home/widgets/add_category.dart';
import 'package:techno_mir/ui/tab/home/widgets/add_product.dart';
import 'package:techno_mir/ui/tab/home/widgets/category_list_page.dart';
import 'package:techno_mir/ui/tab/home/widgets/product_list_page.dart';
import 'package:techno_mir/utils/app_colors.dart';
class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CategoriesListPage(),
    AddCategoryPage(),
    ProductsListPage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Screen Admin",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductsProvider>().clearTexts();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProductAddScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
        elevation: 5,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.white,
              ),
              child: Text(
                'Techno City',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans"),
              ),
            ),
            ListTile(
              title: const Text('Product List'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Add Category'),
              selected: _selectedIndex == 1,
              onTap: () {
                context.read<CategoryProvider>().addNameController.clear();
                context.read<CategoryProvider>().addDescriptionController.clear();
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Categories list'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}