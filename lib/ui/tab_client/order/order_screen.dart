
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:techno_mir/data/model/order/order_model.dart';
import 'package:techno_mir/providers/order_provider.dart';
import 'package:techno_mir/utils/app_colors.dart';
import 'package:techno_mir/utils/app_images.dart';

class OrderScreenClient extends StatefulWidget {
  const OrderScreenClient({super.key});

  @override
  State<OrderScreenClient> createState() => _OrderScreenClientState();
}

class _OrderScreenClientState extends State<OrderScreenClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orders",
          style: TextStyle(color: AppColors.textColorLight),
        ),
      ),
      body: StreamBuilder<List<OrderModel>>(
        stream: context
            .read<OrderProvider>()
            .listenOrdersList(FirebaseAuth.instance.currentUser!.uid),
        builder:
            (BuildContext context, AsyncSnapshot<List<OrderModel>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.isNotEmpty
                ? ListView(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) {
                        OrderModel orderModel = snapshot.data![index];
                        return Slidable(
                          startActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (v) {
                                    context.read<OrderProvider>().deleteOrder(
                                        context: context,
                                        orderId: snapshot.data![index].orderId);
                                  },
                                  backgroundColor: AppColors.c_FE3A30,
                                  label: "delete",
                                  icon: Icons.delete,
                                ),
                                SlidableAction(
                                  onPressed: (v) {

                                  },
                                  backgroundColor: AppColors.c_3669C9,
                                  label: "edit",
                                  icon: Icons.edit,
                                ),
                              ]),
                          child: ListTile(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailScreen(productModel: snapshot.data![index].)))
                            },
                            onLongPress: () {

                            },
                            title: Text(orderModel.productName),
                            subtitle: Text(orderModel.count.toString()),
                            trailing: Text(orderModel.orderStatus),
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: Lottie.asset(AppImages.orderEmpty));
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
