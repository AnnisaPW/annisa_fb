import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ProductListAppBar extends StatelessWidget {
  const ProductListAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Annisa Fb'),
      actions: [
        ElevatedButton(
          onPressed: () {
            html.window.open('https://github.com/AnnisaPW/annisa_fb', 'GitHub');
          },
          child: const Text('GitHub'),
        ),
      ],
    );
  }
}
