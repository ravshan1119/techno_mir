import 'package:flutter/material.dart';

class OrderScreenAdmin extends StatelessWidget {
  const OrderScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Screen",style: TextStyle(color: Colors.black)),
        elevation: 5,
      ),
    );
  }
}
