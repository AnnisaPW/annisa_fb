import 'package:firebase_auth/firebase_auth.dart';
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
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Card(
            shape: const CircleBorder(),
            child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    backgroundImage:
                        snapshot.data!.photoURL == null ? null : NetworkImage('${snapshot.data!.photoURL}'),
                    child: snapshot.data!.photoURL != null
                        ? const SizedBox.shrink()
                        : const Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.grey,
                          ),
                  );
                }
                return CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  child: const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
