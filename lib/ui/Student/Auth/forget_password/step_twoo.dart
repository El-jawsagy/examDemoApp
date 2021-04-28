import 'dart:convert';

import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/rounded_input_field.dart';
import 'package:akhtbaraty/components/text_field_container.dart';
import 'package:akhtbaraty/ui/Student/Auth/forget_password/components/background.dart';
import 'package:akhtbaraty/ui/Student/Auth/forget_password/step_three.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../components/constants.dart';

class StepTwoS extends StatefulWidget {
  @override
  _StepTwoSState createState() => _StepTwoSState();
}

class _StepTwoSState extends State<StepTwoS> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  TextEditingController codeController = TextEditingController();

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
                "CONFIRM CODE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.05),
              TextFieldContainer(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: codeController,
                  cursorColor: kPrimaryColor,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'The Code can not be empty!';
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
                  final String code = codeController.text;

                  if (code.isNotEmpty) {
                    _btnController.start();

                    var route = new MaterialPageRoute(
                      builder: (BuildContext context) => new StepThreeStudent(),
                    );
                    Navigator.of(context).push(route);
                    _btnController.stop();
                  } else {
                    _formKey.currentState.validate();
                    _btnController.error();
                  }
                },
              ),
              SizedBox(height: size.height * 0.02),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => new StepTwoS(),
                    ));
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
