import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent, // Status bar transparan
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.green],
            ),
          ),
          child: const Center(
            child: Text(
              'Main Screen',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
