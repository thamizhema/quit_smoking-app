import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return const Scaffold(
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
