import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/components/text_field_container.dart';
import 'package:akhtbaraty/ui/Student/Auth/forget_password/step_one.dart';
import 'package:akhtbaraty/ui/Student/Home/HomeScreen.dart';
import 'package:akhtbaraty/ui/Student/Welcome/components/body.dart';
import 'package:akhtbaraty/ui/Student/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:akhtbaraty/ui/Student/Auth/login/components/background.dart';
import 'package:akhtbaraty/ui/Student//Auth/signup/signup_screen.dart';
import 'package:akhtbaraty/components/already_have_an_account_acheck.dart';
import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.30,
            ),
            SizedBox(height: size.height * 0.03),
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
                          return 'The Password can not be empty!';
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
                  RoundedButton(
                    text: "LOGIN",
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
            SizedBox(height: size.height * 0.02),
            InkWell(
              onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StudentSignUpScreen();
                      },
                    ),
                  );
             
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StepOneStudent();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Forget password ? ',
                        style: TextStyle(
                            color: kPrimaryColor, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StudentSignUpScreen();
                      },
                    ),
                  );
                
              },
            )
          ],
        ),
      ),
    );
  }
}
