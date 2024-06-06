import 'package:blink_basket/controller/UserController.dart';
import 'package:blink_basket/helper/User_Data_helper.dart';
import 'package:blink_basket/modal/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  List<GlobalKey<FormState>> Formkey =
      List.generate(4, (index) => GlobalKey<FormState>());
  User user = User(
      id: 0,
      name: 'name',
      lastName: 'lastName',
      email: 'email',
      password: 'password');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B51B75),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'WelCome!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            const Text(
              'Sign Up for the Blink Basket App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Form(
              key: Formkey[0],
              child: TextFormField(
                onSaved: (val) {
                  user.name = val ?? 'name';
                },
                validator: (val) =>
                    (val!.isEmpty) ? "Enter your username" : null,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter your name',
                ),
              ),
            ),
            Form(
              key: Formkey[1],
              child: TextFormField(
                onSaved: (val) {
                  user.lastName = val ?? 'lastName';
                },
                validator: (val) =>
                    (val!.isEmpty) ? "Enter your lastname" : null,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Last name',
                ),
              ),
            ),
            Form(
              key: Formkey[2],
              child: TextFormField(
                onSaved: (val) {
                  user.email = val ?? 'email';
                },
                validator: (val) => (val!.isEmpty) ? "Enter your email" : null,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Email Id',
                ),
              ),
            ),
            Form(
              key: Formkey[3],
              child: TextFormField(
                onSaved: (val) {
                  user.password = val ?? 'password';
                },
                validator: (val) =>
                    (val!.isEmpty) ? "Enter your password" : null,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (Formkey[0].currentState!.validate() &&
                      Formkey[1].currentState!.validate() &&
                      Formkey[2].currentState!.validate() &&
                      Formkey[3].currentState!.validate()) {
                    Formkey[0].currentState!.save();
                    Formkey[1].currentState!.save();
                    Formkey[2].currentState!.save();
                    Formkey[3].currentState!.save();
                    Provider.of<UserController>(context, listen: false)
                        .insertData(user: user);
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
