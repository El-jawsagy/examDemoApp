import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:akhtbaraty/ui/Student/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/ui/Student//Auth/login/login_screen.dart';
import 'package:akhtbaraty/ui/Student//Auth/signup/components/background.dart';
import 'package:akhtbaraty/components/already_have_an_account_acheck.dart';
import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/rounded_input_field.dart';
import 'package:akhtbaraty/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:akhtbaraty/components/constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {


  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  int _myCityId;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  bool _isLoading;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.01),
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.01),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  //Name
                  RoundedInputField(
                    hintText: "Name",
                    controller: nameController,
                    icon: Icons.person,
                    onChanged: (val) {
                      _btnController.reset();
                    },
                  ),

                  //Email
                  RoundedInputField(
                    controller: emailController,
                    hintText: "Email",
                    onChanged: (val) {
                      _btnController.reset();
                    },
                    icon: Icons.email,
                  ),

                  //Phone Number
                  RoundedInputField(
                    hintText: "Phone Number",
                    controller: phoneController,
                    onChanged: (val) {
                      _btnController.reset();
                    },
                    icon: Icons.phone,
                  ),

                  //Password
                  RoundedPasswordField(
                    controller: passwordController,
                    onChanged: (val) {
                      _btnController.reset();
                    },
                  ),

                  //Country
                 ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            RoundedButton(
              text: "Sign Up",
              controller: _btnController,
              press: () async {
                final String name = nameController.text;
                final String email = emailController.text;
                final String phoneNumber = phoneController.text;
                final String password = passwordController.text;

                if (name.isNotEmpty &&
                    email.isNotEmpty &&
                    phoneNumber.isNotEmpty &&
                    password.isNotEmpty) {
                  _btnController.start();
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new StudentMainHomePage(),
                  );
                  Navigator.of(context).push(route);
                  _btnController.stop();
                } else {
                  _formKey.currentState.validate();
                  _btnController.error();
                }
              },
            ),
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
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
          ],
        ),
      ),
    );
  }
}
