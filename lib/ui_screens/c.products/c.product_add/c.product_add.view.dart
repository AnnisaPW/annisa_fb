import 'dart:io';

import 'package:annisa_fb/ui_screens/c.products/c.product_add/a.product_add.data.dart';
import 'package:annisa_fb/ui_screens/c.products/c.product_add/b.product_add.ctrl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ProductAddView extends StatefulWidget {
  const ProductAddView({super.key});

  @override
  State<ProductAddView> createState() => _ProductAddViewState();
}

class _ProductAddViewState extends State<ProductAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Add'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameCtrlAdd,
                  decoration: InputDecoration(
                    labelText: 'Product\'s Name',
                    hintText: 'Name of the product',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(
                      Icons.shopping_bag,
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: priceCtrlAdd,
                  decoration: InputDecoration(
                    labelText: 'Product\'s Price',
                    alignLabelWithHint: true,
                    hintText: 'e.g. 10000',
                    prefixIcon: Icon(
                      Icons.price_change,
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descriptionCtrlAdd,
                  decoration: InputDecoration(
                    labelText: 'Product\'s Description',
                    alignLabelWithHint: true,
                    hintText: 'Description of the product',
                    prefixIcon: Icon(
                      Icons.description,
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: quantityCtrlAdd,
                  decoration: InputDecoration(
                    labelText: 'Product\'s Quantity',
                    alignLabelWithHint: true,
                    hintText: 'e.g. 100',
                    prefixIcon: Icon(
                      Icons.production_quantity_limits,
                      color: Colors.black54.withOpacity(0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () async {
                    pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                    debugPrint(pickedFile?.path);
                    debugPrint(pickedFile?.name);
                    setState(() {});
                  },
                  child: const Text('pick image from gallery'),
                ),
                const SizedBox(height: 10),
                pickedFile == null
                    ? const SizedBox.shrink()
                    : SizedBox(
                        width: 100,
                        height: 100,
                        child: kIsWeb
                            ? Image.network(pickedFile!.path)
                            : Image.file(
                                File(pickedFile!.path),
                              ),
                      ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(200),
                  ),
                  onPressed: () async {
                    final name = nameCtrlAdd.text;
                    final price = int.parse(priceCtrlAdd.text);
                    final description = descriptionCtrlAdd.text;
                    final quantity = int.parse(quantityCtrlAdd.text);
                    await addProduct(name, price, description, quantity);
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
