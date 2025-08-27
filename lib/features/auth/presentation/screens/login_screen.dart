import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //logo and icon will be placed here
                SizedBox(height: 30),
                SizedBox(
                  width: 120,
                  height: 100,
                  child: SvgPicture.asset("assets/svgs/logoDark.svg"),
                ),
                SizedBox(
                  width: 120,
                  height: 50,
                  child: SvgPicture.asset(
                    "assets/svgs/onno_text.svg",
                    colorFilter: ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // SizedBox(height: 150),
                Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 40),
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
                    hintText: "Enter your username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.black, thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: const Text("or"),
                    ),
                    Expanded(child: Divider(color: Colors.black, thickness: 1)),
                  ],
                ),
                SizedBox(height: 5),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.goNamed("homeScreen");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFF20CFA3),
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have any account with us?"),
                    TextButton(
                      onPressed: () {},
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
