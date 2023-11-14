import 'package:chatflut/components/cs_button.dart';
import 'package:chatflut/components/cs_text_field.dart';
// import 'package:chatflut/screens/home_screen.dart';
import 'package:chatflut/screens/register_screen.dart';
import 'package:chatflut/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //email-controller
    final emailController = TextEditingController();

    //password-controller
    final passwordController = TextEditingController();

    //handle sign in
    void signin() async {
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[600],
                ),

                const SizedBox(
                  height: 50,
                ),
                //wellcomeback message
                const Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Poppins-Bold",
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(
                  height: 30,
                ),

                //email text-field
                CsTextField(
                    controller: emailController,
                    hintText: "Email",
                    obsecureText: false),

                const SizedBox(
                  height: 20,
                ),

                //password text-field

                CsTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obsecureText: true),

                const SizedBox(
                  height: 20,
                ),

                //sign in button
                CsButton(
                    ontap: signin,
                    // () {
                    //   debugPrint("[info:Navigate to register]");
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (ctx) => const MainScreen()));
                    // },
                    text: "Sign In"),

                const SizedBox(
                  height: 20,
                ),

                //don't have an account
                Row(
                  children: [
                    const Text("Have an account?"),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          debugPrint("[info:Navigate to register]");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const RegisterScreen()));
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
