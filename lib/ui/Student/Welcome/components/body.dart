import 'package:akhtbaraty/ui/Student/Home/HomeScreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:akhtbaraty/ui/Student/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/ui/Student//Auth//login/login_screen.dart';
import 'package:akhtbaraty/ui/Student//Auth//signup/signup_screen.dart';
import 'package:akhtbaraty/ui/Student/Welcome/components/background.dart';
import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME STUDENT TO\nAKHTBARATY",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StudentLoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StudentSignUpScreen();
                      },
                    ),
                  );
              
              },
            ),
            RoundedButton(
              text: "SKIP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return StudentMainHomePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
