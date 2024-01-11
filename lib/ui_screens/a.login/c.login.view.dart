import 'package:annisa_fb/ui_screens/a.login/a.login.data.dart';
import 'package:annisa_fb/ui_screens/a.login/b.login.ctrl.dart';
import 'package:annisa_fb/ui_screens/b.register/c.register.view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailLoginCtrl,
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
                  controller: passwordLoginCtrl,
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
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(200),
                  ),
                  onPressed: () async {
                    await signInWithEmailPassword(
                      emailLoginCtrl.text,
                      passwordLoginCtrl.text,
                    );
                  },
                  child: const Text(
                    "Submit",
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(200),
                  ),
                  onPressed: () async {
                    await signInGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/images/g-logo.png'),
                      ),
                      const SizedBox(width: 5),
                      const Text('Sign in with Google'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size.fromWidth(200),
                  ),
                  onPressed: () async {
                    await signInAnonymous();
                  },
                  child: const Text('Sign in Anonymously'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    var route = MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    );
                    Navigator.pushReplacement(context, route);
                  },
                  child: const Text('Don\'t have any account? Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
