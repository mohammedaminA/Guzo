import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: height / double.infinity,
            height: height,
            child: Image.asset('images/12.jpg'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 30, color: Colors.white),
                    fillColor: Colors.white,
                    hoverColor: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
