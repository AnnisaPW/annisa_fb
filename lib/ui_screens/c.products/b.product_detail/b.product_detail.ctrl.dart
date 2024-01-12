import 'package:annisa_fb/models/a.product.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/a.product_list.data.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

Future<Product> getProductDetail(String id) async {
  final result = await FirebaseFirestore.instance.collection(collDetail).doc(id).get();
  productDetail = Product.fromMap(result.data() ?? {});
  return productDetail!;
}

Future<void> deleteDoc(BuildContext context, String id) async {
  await FirebaseFirestore.instance.collection(collList).doc(id).delete();
  await FirebaseFirestore.instance.collection(collDetail).doc(id).delete();
  final index = productList.indexWhere((element) => element.id == id);
  productList.removeAt(index);
  // ignore: use_build_context_synchronously
  Navigator.pop(context);
}
