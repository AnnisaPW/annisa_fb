import 'package:annisa_fb/ui_screens/a.login/c.login.view.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/c.product_list.view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          // brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      // home: const RegisterView(),
      // home: const ProductListView(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProductListView();
          }
          return const LoginView();
        },
      ),
    );
  }
}
