import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/b.product_detail.ctrl.dart';
import 'package:flutter/material.dart';

class ProductDetailAppBar extends StatelessWidget {
  const ProductDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Product Detail'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            await deleteDoc(context, productDetail!.id);
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
