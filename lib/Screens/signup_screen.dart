import 'package:flutter/material.dart';
import 'package:guzo/login_screen.dart';
import 'package:sign_button/sign_button.dart';

class SignUp extends StatelessWidget {
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
                        'Sign Up',
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
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                            textInputType: TextInputType.name,
                            hintText: 'Full Name',
                            icon: Icons.person,
                            obscureText: false),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                            textInputType: TextInputType.phone,
                            hintText: 'Phone Number',
                            icon: Icons.phone,
                            obscureText: false),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          icon: Icons.email,
                          obscureText: false,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                            textInputType: TextInputType.text,
                            hintText: 'Password',
                            icon: Icons.vpn_key,
                            obscureText: true),
                        TextButton(
                          child: Text(
                            'Already Have An Account? Login here',
                            style: TextStyle(
                                textBaseline: TextBaseline.alphabetic,
                                color: Colors.black,
                                fontFamily: 'Roboto'),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginScreen();
                                },
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent),
                            minimumSize: MaterialStateProperty.all<Size>(
                              Size(150, 25),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.03,
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

class CustomTextWidget extends StatelessWidget {
  final TextInputType textInputType;
  final String hintText;
  final IconData icon;
  final bool obscureText;

  CustomTextWidget(
      {@required this.textInputType,
      @required this.hintText,
      @required this.icon,
      @required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: textInputType,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            TextStyle(fontSize: 20, fontFamily: 'Roboto', color: Colors.black),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.lightBlueAccent,
        prefixIcon: Icon(
          icon,
        ),
      ),
    );
  }
}
