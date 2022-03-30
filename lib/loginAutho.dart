import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
final FirebaseAuth auth = FirebaseAuth.instance;
class AuthDemo extends StatefulWidget {

  const AuthDemo({Key? key}) : super(key: key);

  @override
  _AuthDemoState createState() => _AuthDemoState();
}

class _AuthDemoState extends State<AuthDemo> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
String? email;
  create() async {
    User? user = (await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text))
        .user;

    email = user!.email!;
    setState(() {});
    print(user.email);
    print(user.uid);
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (auth.currentUser != null) {
                auth.signOut();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('No one has signed in.'),
                ));
              }
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body:   Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email, size: 30.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text('LOGIN'),
                onPressed: () {
                  create();
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(email!),
            ],
          ),
        ],
      ),

    );
  }
}
