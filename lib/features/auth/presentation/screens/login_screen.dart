import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onno/core/utils/assets_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                //logo and icon will be placed here
                SizedBox(height: 60),
                SizedBox(
                  width: 120,
                  height: 100,
                  child: Image.asset(AssetsPath.onnoLogoPng),
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: Image.asset(AssetsPath.onnoTextSolidColorPng),
                ),
                SizedBox(height: 80),
                Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "A quick setup to get started",
                //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                //   ),
                // ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    hintText: "Enter your Username",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color.fromARGB(255, 35, 173, 139),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF2F2F2),
                    hintText: "Enter your Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        width: 1,
                        color: const Color.fromARGB(255, 35, 173, 139),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed("app");
                    },
                    child: const Text("Login"),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have any account with us?"),
                    TextButton(
                      onPressed: () {
                        context.goNamed("registration");
                      },
                      child: Text("Register", textAlign: TextAlign.start),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
