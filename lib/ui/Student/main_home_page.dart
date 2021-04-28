import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/ui/Student/Auth/signup/signup_screen.dart';
import 'package:akhtbaraty/ui/Student/Exam/exam_screen.dart';
import 'package:akhtbaraty/ui/Student/Home/HomeScreen.dart';
import 'package:akhtbaraty/ui/Student/profile/Profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Welcome/components/body.dart';

class StudentMainHomePage extends StatefulWidget {
  @override
  _StudentMainHomePageState createState() => _StudentMainHomePageState();
}

class _StudentMainHomePageState extends State<StudentMainHomePage> {
  SharedPreferences sharedPreferences;

  int currentIndex = 0;
  final tabs = [
    Center(child: StudentHomeScreen()),
    Center(child: StudentExam()),
    Center(child: ProfileScreen()),
  ];

  @override
  void initState() {
    super.initState();
    checkLoginState();
  }

  checkLoginState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("access_token") == null) {
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => StudentSignUpScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AKHTBARATY'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.nights_stay_outlined,
              color: kPrimaryLightColor,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.filter_frames_rounded,
            ),
            label: 'Exams',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: tabs[currentIndex],
    );
  }
}
