import 'package:flutter/material.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Product Detail'),
      centerTitle: true,
    );
  }
}
