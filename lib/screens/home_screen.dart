// import 'dart:js';
import 'package:chatflut/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //handle signout
    void signOut() {
      //instance initiate
      final authService = Provider.of<AuthService>(context, listen: false);
      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Timeline"),
        actions: [
          //sign out button
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        )),
      ),
    );
  }
}
