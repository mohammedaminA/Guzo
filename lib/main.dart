import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:guzo/dataHandler/appData.dart';
import 'package:guzo/login_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('users');

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: FirebaseAuth.instance.currentUser != null
            ? MainScreen()
            : LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
