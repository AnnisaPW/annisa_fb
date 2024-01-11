import 'package:annisa_fb/ui_screens/b.products/a.product_list/a.product_list.data.dart';
import 'package:annisa_fb/ui_screens/b.products/a.product_list/b.product_list.ctrl.dart';
import 'package:annisa_fb/ui_screens/b.products/a.product_list/widgets/a.product_list.appbar.dart';
import 'package:annisa_fb/ui_screens/b.products/a.product_list/widgets/b.product_list.card.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    loadProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: ProductListAppBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: getProductList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (productList.isEmpty) {
                  return const Center(
                    child: Text('product is empty'),
                  );
                }
                return Wrap(
                  children: [
                    ...List.generate(
                      productList.length,
                      (index) {
                        final data = productList[index];
                        return ProductListCard(data: data);
                      },
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
