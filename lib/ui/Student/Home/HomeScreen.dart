import 'package:akhtbaraty/ui/Student/Home//components/body.dart';
import 'package:flutter/material.dart';


class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeuitate createState() => _StudentHomeuitate();
}

int _currentIndex = 0;
final List<Widget> _children = [];

class _StudentHomeuitate extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
