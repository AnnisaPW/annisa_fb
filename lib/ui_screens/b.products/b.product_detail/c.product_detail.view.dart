import 'package:annisa_fb/app/utils/functions.dart';
import 'package:annisa_fb/ui_screens/b.products/b.product_detail/a.product_detail.data.dart';
import 'package:annisa_fb/ui_screens/b.products/b.product_detail/b.product_detail.ctrl.dart';
import 'package:annisa_fb/ui_screens/b.products/b.product_detail/widgets/a.product_detail.appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final String id;
  const ProductDetailView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProductDetailAppBar(),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Card(
            child: Container(
              color: Colors.white,
              child: FutureBuilder(
                future: getProductDetail(id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (productDetail != null) {
                      return Column(
                        children: [
                          SizedBox(
                            // color: Colors.blue,
                            height: 300,
                            child: Image.network(productDetail!.imageUrl),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  productDetail!.name,
                                  textScaler: const TextScaler.linear(1.7),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Rp',
                                    ),
                                    Text(
                                      Fun.formatRupiah.format(productDetail!.price),
                                      textScaler: const TextScaler.linear(1.7),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  productDetail!.description,
                                  textScaler: const TextScaler.linear(1.3),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Stock: ${productDetail!.quantity}',
                                  textScaler: const TextScaler.linear(1.3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
