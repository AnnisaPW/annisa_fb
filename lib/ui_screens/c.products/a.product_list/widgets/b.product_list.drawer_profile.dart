import 'package:annisa_fb/ui_screens/c.products/a.product_list/b.product_list.ctrl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductListDrawerProfile extends StatefulWidget {
  const ProductListDrawerProfile({
    super.key,
  });

  @override
  State<ProductListDrawerProfile> createState() => _ProductListDrawerProfileState();
}

class _ProductListDrawerProfileState extends State<ProductListDrawerProfile> {
  Stream? authState;
  @override
  void initState() {
    super.initState();
    authState = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).closeEndDrawer();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: authState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data!;
                      return Column(
                        children: [
                          Card(
                            shape: const CircleBorder(),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              backgroundImage:
                                  snapshot.data!.photoURL == null ? null : NetworkImage('${snapshot.data!.photoURL}'),
                              child: snapshot.data!.photoURL != null
                                  ? const SizedBox.shrink()
                                  : const Icon(
                                      Icons.person,
                                      size: 85,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          data.isAnonymous
                              ? const Text('Anonymous')
                              : data.displayName == null
                                  ? const SizedBox.shrink()
                                  : ListTile(
                                      title: const Text(
                                        'Username',
                                        textAlign: TextAlign.center,
                                      ),
                                      subtitle: Text(
                                        '${data.displayName}',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                          data.email == null
                              ? const SizedBox.shrink()
                              : ListTile(
                                  title: const Text(
                                    'Email',
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    '${data.email}',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                          const SizedBox(height: 20),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await signOut();
                            },
                            icon: const Icon(Icons.logout),
                            label: const Text('Sign out'),
                          ),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () async {
                              await snapshot.data!.delete();
                            },
                            child: const Text('Delete Account'),
                          ),
                        ],
                      );
                    }
                    return const Text('you are not logged in yet');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
