import 'package:annisa_fb/app/utils/functions.dart';
import 'package:annisa_fb/ui_screens/b.products/b.product_detail/c.product_detail.view.dart';
import 'package:flutter/material.dart';

import '../../../../models/a.product.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({
    super.key,
    required this.data,
  });

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailView(id: data.id),
            ),
          );
        },
        child: SizedBox(
          width: 150,
          height: 210,
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: Image.network(data.imageUrl),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                height: 60,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.name,
                        textScaler: const TextScaler.linear(0.8),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Rp',
                            textScaler: TextScaler.linear(0.7),
                          ),
                          Text(
                            Fun.formatRupiah.format(data.price),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
