import 'package:annisa_fb/ui_screens/c.products/a.product_list/a.product_list.data.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/b.product_list.ctrl.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/widgets/a.product_list.appbar.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/widgets/b.product_list.drawer_profile.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/widgets/c.product_list.card.dart';
import 'package:annisa_fb/ui_screens/c.products/c.product_add/c.product_add.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                          builder: (context) => const ProductAddView(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          }
          return const SizedBox.shrink();
        },
      ),
      endDrawer: const ProductListDrawerProfile(),
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
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          ...List.generate(
                            productList.length,
                            (index) {
                              final data = productList[index];
                              return ProductListCard(data: data);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      isEndOfList
                          ? const Text('--- end of list ---')
                          : snapshot.connectionState == ConnectionState.waiting
                              ? const CircularProgressIndicator()
                              : OutlinedButton(
                                  onPressed: () {
                                    loadProductList();
                                    setState(() {});
                                  },
                                  child: const Text('loadmore'),
                                )
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
