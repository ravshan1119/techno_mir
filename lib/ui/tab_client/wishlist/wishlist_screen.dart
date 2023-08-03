import 'package:flutter/material.dart';

class WishlistScreenClient extends StatelessWidget {
  const WishlistScreenClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist Screen Client",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 5,
      ),
    );
  }
}
