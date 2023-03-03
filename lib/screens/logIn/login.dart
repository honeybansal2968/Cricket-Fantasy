import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';
import 'package:flutter_application_1/screens/dashboard/dashboard.dart';
import 'package:flutter_application_1/screens/logIn/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: AnimatedGradient(
        colors: [
          const Color.fromARGB(255, 1, 45, 187),
          Colors.blue,
          Colors.lightGreen,
          Color.fromARGB(255, 19, 71, 216)
        ],
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Cricket Fantasy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width * 0.9,
                child: Column(children: [
                  TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "UserName",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 241, 239),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email Address",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 241, 239),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: const Color.fromARGB(255, 241, 241, 239),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return DashBoard();
                    })),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    backgroundColor: const Color.fromARGB(255, 72, 91, 153)),
                child: const SizedBox(
                  width: 100,
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
