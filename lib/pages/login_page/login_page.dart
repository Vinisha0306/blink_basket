import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'WelCome Back!',
            ),
          ),
          const Text(
            'Login to your account',
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Enter your name',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Password',
            ),
          ),
        ],
      ),
    );
  }
}
