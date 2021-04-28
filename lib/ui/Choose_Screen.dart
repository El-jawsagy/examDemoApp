import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/ui/Student/Welcome/welcome_screen.dart';
import 'package:akhtbaraty/ui/Teacher/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/ui/Teacher//Auth/login/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.01),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.30,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                "I'M ..",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 18),
              ),
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "STUDENT",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StudentWelcomeScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              RoundedButton(
                text: "TEACHER",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeTeacherScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
