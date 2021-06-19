import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL),
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}
