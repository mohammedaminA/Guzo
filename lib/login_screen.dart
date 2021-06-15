import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(maxHeight: size.height, maxWidth: size.width),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
              Colors.blue
            ], begin: Alignment.topLeft, end: Alignment.centerRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Addis Ababa's top ride hailing app",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/Guzo.png',
                          height: size.height / 5,
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            prefixIcon: Icon(
                              Icons.email_rounded,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        TextField(
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                color: Colors.black),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.lightBlueAccent,
                            prefixIcon: Icon(Icons.vpn_key),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SignInButton.mini(
                              buttonType: ButtonType.google,
                              onPressed: () {},
                            ),
                            SignInButton.mini(
                              buttonType: ButtonType.facebook,
                              onPressed: () {},
                            ),
                            SignInButton.mini(
                              buttonType: ButtonType.microsoft,
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
