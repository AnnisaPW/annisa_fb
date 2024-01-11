// ignore_for_file: use_build_context_synchronously

import 'package:annisa_fb/ui_screens/b.register/a.register.data.dart';
import 'package:annisa_fb/ui_screens/b.register/b.register.ctrl.dart';
import 'package:annisa_fb/ui_screens/c.products/a.product_list/c.product_list.view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Account'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailRegistCtrl,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Input your email',
                    prefixIcon: Icon(
                      Icons.email,
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
                  controller: passwordRegistCtrl,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Input your password',
                    prefixIcon: Icon(
                      Icons.lock,
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
                  controller: passwordRetypeRegistCtrl,
                  decoration: InputDecoration(
                    labelText: 'Retype Password',
                    hintText: 'Retype your password',
                    prefixIcon: Icon(
                      Icons.lock,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(200),
                  ),
                  onPressed: () async {
                    await signUpWithEmailPassword(
                      emailRegistCtrl.text,
                      passwordRegistCtrl.text,
                    );
                    // await signOut();

                    const snackBar = SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Your Email has been registered!'),
                      duration: Duration(seconds: 2),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    var route = MaterialPageRoute(
                      builder: (context) => const ProductListView(),
                    );
                    Navigator.pushReplacement(context, route);
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
