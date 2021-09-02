import 'package:flutter/material.dart';
import 'package:shop_flutter/screens/cart_empty.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CartEmpty(),
      ),
    );
  }
}
