import 'dart:convert';
import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/components/rounded_new_password.dart';
import 'package:akhtbaraty/components/text_field_container.dart';
import 'package:http/http.dart' as http;
import 'package:akhtbaraty/ui/Student/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/ui/Student/Auth/forget_password/components/background.dart';
import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepThreeStudent extends StatefulWidget {
  @override
  _StepThreeStudentState createState() => _StepThreeStudentState();
}

class _StepThreeStudentState extends State<StepThreeStudent> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading;
  SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "NEW PASSWORD",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.30,
              ),
              SizedBox(height: size.height * 0.05),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldContainer(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        cursorColor: kPrimaryColor,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'The email can not be empty!';
                          }
                        },
                        onChanged: (val) {
                          _btnController.reset();
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                          ),
                          hintText: "Email, Username",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'The mobile number can not be empty!';
                          }
                        },
                        onChanged: (val) {
                          _btnController.reset();
                        },
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: kPrimaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    RoundedButton(
                      text: "UPDATE & LOGIN",
                      controller: _btnController,
                      press: () async {
                        final String email = emailController.text;
                        final String password = passwordController.text;

                        if (email.isNotEmpty && password.isNotEmpty) {
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
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.08),
            ],
          ),
        ),
      ),
    );
  }
}
