import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/data/model/category/category_model.dart';
import 'package:techno_mir/providers/category_provider.dart';
class ProductsListPageClient extends StatefulWidget {
  const ProductsListPageClient({super.key});

  @override
  State<ProductsListPageClient> createState() => _ProductsListPageClientState();
}

class _ProductsListPageClientState extends State<ProductsListPageClient> {
  String selectedCategoryId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<CategoryModel>>(
        stream: context.read<CategoryProvider>().getCategories(),
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        snapshot.data!.length,
                        (index) {
                          CategoryModel categoryModel = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategoryId = categoryModel.categoryId;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: selectedCategoryId ==
                                        categoryModel.categoryId
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              height: 100,
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Text(
                                  categoryModel.categoryName,
                                  style: TextStyle(
                                    color: selectedCategoryId ==
                                            categoryModel.categoryId
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const Center(child: Text("Empty!"));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
