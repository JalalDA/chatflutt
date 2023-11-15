import 'package:chatflut/components/cs_button.dart';
import 'package:chatflut/components/cs_text_field.dart';
// import 'package:chatflut/screens/home_screen.dart';
import 'package:chatflut/screens/login_screen.dart';
import 'package:chatflut/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    //email-controller
    final emailController = TextEditingController();

    //password-controller
    final passwordController = TextEditingController();

    //confirm-password-controller
    final confirmPasswordController = TextEditingController();

    //handle sign up
    void signUp() async {
      //handle confirm password
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Passwords doesn't match!"),
          ),
        );
        return;
      }
      //handle sign up
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (ctx) => const MainScreen()));
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
                  "Register",
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

                //confirm password text-field

                CsTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm Password",
                    obsecureText: true),

                const SizedBox(
                  height: 20,
                ),

                //sign in button
                CsButton(ontap: signUp, text: "Register"),

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
                        onTap: () => {
                              debugPrint("[info:Navigate to login]"),
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const LoginScreen()))
                            },
                        child: const Text(
                          "Login",
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
