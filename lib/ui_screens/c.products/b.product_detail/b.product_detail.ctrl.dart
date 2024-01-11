import 'package:annisa_fb/models/a.product.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<Product> getProductDetail(String id) async {
  final result = await FirebaseFirestore.instance.collection(collDetail).doc(id).get();
  productDetail = Product.fromMap(result.data() ?? {});
  return productDetail!;
}
