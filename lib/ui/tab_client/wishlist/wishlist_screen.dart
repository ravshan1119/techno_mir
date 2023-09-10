import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/data/model/product/product_model.dart';
import 'package:techno_mir/providers/products_provider.dart';
import 'package:techno_mir/ui/tab_client/home/widgets/product_container.dart';
import 'package:techno_mir/ui/tab_client/home/widgets/product_detailt_screen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class WishlistScreenClient extends StatelessWidget {
  const WishlistScreenClient({super.key});
  final String categoryId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text(
          "Wishlist",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream:
          context.read<ProductsProvider>().getProducts(categoryId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  ProductModel productModel = snapshot.data![index];
                  return ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ProductDetailScreen(
                                productModel: productModel, index: index);
                          }));
                    },
                    child: ProductContainer(
                        images: productModel.productImages,
                        title: productModel.productName,
                        currency: productModel.currency,
                        price: productModel.price.toString()),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
