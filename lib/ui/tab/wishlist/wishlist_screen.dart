import 'package:flutter/material.dart';

class WishlistScreenAdmin extends StatelessWidget {
  const WishlistScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist Screen",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
      ),
    );
  }
}
