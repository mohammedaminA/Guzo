import 'package:flutter/material.dart';
import 'package:guzo/Screens/main_screen.dart';
import 'package:guzo/login_screen.dart';
import 'package:sign_button/sign_button.dart';
import 'package:guzo/widgets/custom_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:guzo/main.dart';

class SignUp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
                          obscureText: false,
                          controller: nameController,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                          textInputType: TextInputType.phone,
                          hintText: 'Phone Number',
                          icon: Icons.phone,
                          obscureText: false,
                          controller: phoneController,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                          hintText: 'Email',
                          textInputType: TextInputType.emailAddress,
                          icon: Icons.email,
                          obscureText: false,
                          controller: emailController,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        CustomTextWidget(
                          textInputType: TextInputType.text,
                          hintText: 'Password',
                          icon: Icons.vpn_key,
                          obscureText: true,
                          controller: passwordController,
                        ),
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
                          onPressed: () {
                            registerUser(context);
                          },
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

  final firebase = FirebaseAuth.instance;

  registerUser(BuildContext context) async {
    final User user = (await firebase.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    ))
        .user;

    if (user != null) {
      // persist to database
      Map userData = {
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "password": passwordController.text
      };

      userRef.child(user.uid).set(userData);
      Navigator.push(
        context,
        (MaterialPageRoute(
          builder: (context) => MainScreen(),
        )),
      );
    } else {
      //error message
    }
  }
}
