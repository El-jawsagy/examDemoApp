import 'dart:convert';
import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/components/text_field_container.dart';
import 'package:akhtbaraty/ui/Student/Auth/forget_password/components/background.dart';
import 'package:http/http.dart' as http;
import 'package:akhtbaraty/ui/Student/Auth/forget_password/step_twoo.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepOneStudent extends StatefulWidget {
  @override
  _StepOneStudentState createState() => _StepOneStudentState();
}

class _StepOneStudentState extends State<StepOneStudent> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  TextEditingController emailController = TextEditingController();

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
                "FORGET PASSWORD",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
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
              SizedBox(height: size.height * 0.02),
              RoundedButton(
                text: "NEXT",
                controller: _btnController,
                press: () async {
                  final String email = emailController.text;

                  if (email.isNotEmpty) {
                    _btnController.start();

                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new StepTwoS(),
                    );
                    Navigator.of(context).push(route);
                    _btnController.stop();
                  } else {
                    _formKey.currentState.validate();
                    _btnController.error();
                  }
                },
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
