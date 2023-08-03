import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/data/model/category/category_model.dart';
import 'package:techno_mir/data/model/product/product_model.dart';
import 'package:techno_mir/providers/category_provider.dart';
import 'package:techno_mir/providers/products_provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductsListPage extends StatefulWidget {
  const ProductsListPage({super.key});

  @override
  State<ProductsListPage> createState() => _ProductsListPageState();
}

class _ProductsListPageState extends State<ProductsListPage> {
   String categoryId="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<List<CategoryModel>>(
              stream: context.read<CategoryProvider>().getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 60.h,
                    child: Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ZoomTapAnimation(
                            onTap:(){
                              categoryId="";
                              setState(() {

                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 9.h),
                              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color:categoryId==""?Colors.tealAccent:Colors.amber),
                              child: const Center(child: Text("All")),
                            ),
                          ),
                          ...List.generate(
                            snapshot.data!.length,
                                (index) => ZoomTapAnimation(
                              onTap: (){
                                categoryId=snapshot.data![index].categoryId;
                                setState(() {

                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 9.h),
                                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                                height: 50.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.r),
                                    color:categoryId==snapshot.data![index].categoryId?Colors.tealAccent: Colors.amber),
                                child: Center(child: Text(snapshot.data![index].categoryName)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }
          ),
          StreamBuilder<List<ProductModel>>(
            stream: context.read<ProductsProvider>().getProducts(categoryId),
            builder: (BuildContext context,
                AsyncSnapshot<List<ProductModel>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data!.isNotEmpty
                    ? Expanded(
                        child: ListView(
                          children: List.generate(
                            snapshot.data!.length,
                            (index) {
                              ProductModel productModel = snapshot.data![index];
                              return ListTile(
                                onLongPress: () {
                                  context
                                      .read<ProductsProvider>()
                                      .deleteProduct(
                                        context: context,
                                        productId: productModel.productId,
                                      );
                                },
                                title: Text(productModel.productName),
                                subtitle: Text(productModel.description),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : const Center(child: Text("Product Empty!"));
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
