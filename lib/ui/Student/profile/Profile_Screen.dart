import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/ui/Student/profile/components/profile_list_item.dart';
import 'package:akhtbaraty/ui/Teacher/Home//components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    return Builder(
      builder: (context) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Container(
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'UserName : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'ُMahmoud Eljawsagy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PhoneNumber : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '01032820486',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email : ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'mahmoudragab0809',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileListItem(
                      color: kPrimaryLightColor,
                      icon: LineAwesomeIcons.user_shield,
                      text: 'Edit Personal Information',
                      StyleColor: kPrimaryColor,
                      iconColor: kPrimaryColor,
                      nextColor: kPrimaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(height: kSpacingUnit.w * 2),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ProfileListItem(
                      nextColor: Colors.white,
                      StyleColor: Colors.white,
                      iconColor: Colors.white,
                      color: kPrimaryColor,
                      icon: LineAwesomeIcons.question_circle,
                      text: 'How To Use',
                    ),
                    ProfileListItem(
                      nextColor: Colors.white,
                      StyleColor: Colors.white,
                      color: kPrimaryColor,
                      icon: LineAwesomeIcons.rocket_chat,
                      iconColor: Colors.white,
                      text: 'Frequently Asked Questions',
                    ),
                    ProfileListItem(
                      nextColor: Colors.white,
                      StyleColor: Colors.white,
                      iconColor: Colors.white,
                      color: kPrimaryColor,
                      icon: LineAwesomeIcons.language,
                      text: 'Change Language',
                    ),
                    ProfileListItem(
                      nextColor: Colors.white,
                      StyleColor: Colors.white,
                      iconColor: Colors.white,
                      color: kPrimaryColor,
                      icon: LineAwesomeIcons.sms,
                      text: 'About Us',
                    ),
                    ProfileListItem(
                      nextColor: Colors.white,
                      StyleColor: Colors.white,
                      iconColor: Colors.white,
                      color: kPrimaryColor,
                      icon: LineAwesomeIcons.alternate_sign_out,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
