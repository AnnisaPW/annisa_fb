import 'package:annisa_fb/models/a.product.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/a.product_list.data.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:annisa_fb/ui_screens/c.products/c.product_add/a.product_add.data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

Future<void> editProduct(BuildContext context, String name, int price, String description, int quantity) async {
  Product product = Product(
    id: productDetail!.id,
    name: name,
    price: price,
    description: description,
    quantity: quantity,
    createdAt: productDetail!.createdAt,
    updatedAt: DateTime.now().toString(),
    imageUrl: productDetail!.imageUrl,
  );
  if (pickedFile != null) {
    final image = await uploadImage();
    final newProduct = product.copyWith(imageUrl: image);
    product = newProduct;
  }
  final productMap = product.toMap();
  await FirebaseFirestore.instance.collection(collList).doc(product.id).set(
    {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'image_url': product.imageUrl,
      'created_at': product.createdAt,
    },
  );
  await FirebaseFirestore.instance.collection(collDetail).doc(product.id).set(productMap);

  final index = productList.indexWhere((element) => element.id == product.id);

  productList[index] = product;
  productDetail = product;
  // ignore: use_build_context_synchronously
  Navigator.pop(context);
}

Future<String> uploadImage() async {
  if (pickedFile != null) {
    final imageBytes = await pickedFile!.readAsBytes();
    debugPrint(pickedFile!.mimeType);
    final task = await FirebaseStorage.instance.ref('products/${UniqueKey()}-${pickedFile!.name}').putData(
          imageBytes,
          SettableMetadata(contentType: pickedFile!.mimeType),
        );
    final snapshot = task;
    imageUrl = await snapshot.ref.getDownloadURL();

    debugPrint(imageUrl);
    pickedFile = null;
  }
  return imageUrl ?? '';
}
