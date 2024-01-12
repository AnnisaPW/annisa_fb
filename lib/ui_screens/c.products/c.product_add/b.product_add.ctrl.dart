import 'package:annisa_fb/models/a.product.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/a.product_list.data.dart';
import 'package:annisa_fb/ui_screens/c.products/b.product_detail/a.product_detail.data.dart';
import 'package:annisa_fb/ui_screens/c.products/c.product_add/a.product_add.data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

Future<void> addProduct(String name, int price, String description, int quantity) async {
  final product = Product(
    id: const Uuid().v1(),
    name: name,
    price: price,
    description: description,
    quantity: quantity,
    createdAt: DateTime.now().toString(),
  );
  final image = await uploadImage();
  final newProduct = product.copyWith(imageUrl: image);
  final productMap = newProduct.toMap();
  await FirebaseFirestore.instance.collection(collList).doc(newProduct.id).set(
    {
      'id': newProduct.id,
      'name': newProduct.name,
      'price': newProduct.price,
      'image_url': newProduct.imageUrl,
      'created_at': newProduct.createdAt,
    },
  );
  await FirebaseFirestore.instance.collection(collDetail).doc(newProduct.id).set(productMap);
  productList.insert(0, newProduct);
}

Future<String> uploadImage() async {
  if (pickedFile != null) {
    final imageBytes = await pickedFile!.readAsBytes();
    debugPrint(pickedFile!.mimeType);
    final task = await FirebaseStorage.instance.ref('profile/${UniqueKey()}-${pickedFile!.name}').putData(
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
