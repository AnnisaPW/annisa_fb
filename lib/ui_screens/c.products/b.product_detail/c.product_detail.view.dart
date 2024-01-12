import 'package:annisa_fb/app/utils/functions.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/b.product_detail.ctrl.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/widgets/a.product_detail.appbar.dart';
import 'package:annisa_fb/ui_screens/c.products/d.product_edit/c.product_edit.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductDetailView extends StatefulWidget {
  final String id;
  const ProductDetailView({super.key, required this.id});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProductDetailAppBar(),
      ),
      floatingActionButton: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.email == 'admin@admin.com') {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Icon(Icons.refresh),
                  ),
                  const SizedBox(height: 5),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductEditView(),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Card(
            child: Container(
              color: Colors.white,
              child: FutureBuilder(
                future: getProductDetail(widget.id),
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
