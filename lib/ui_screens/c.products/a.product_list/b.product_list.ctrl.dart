import 'package:annisa_fb/models/a.product.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/a.product_list.data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Product>> getProductList() async {
  List<Product> products = [];
  final result = await FirebaseFirestore.instance
      .collection('product_list')
      .orderBy('created_at', descending: true)
      .limit(3)
      .startAfter([productList.isEmpty ? '9999-99-99 99:99:99.999' : productList.last.createdAt]).get();
  for (var product in result.docs) {
    products.add(Product.fromMap(product.data()));
  }

  return products;
}

loadProductList() async {
  final result = await getProductList();
  productList.addAll(result);
  if (result.length < 3) {
    isEndOfList = true;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

refreshProducts() {
  productList = [];
  isEndOfList = false;
  selectedId = '';
  loadProductList();
}
