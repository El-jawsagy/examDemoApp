import 'package:akhtbaraty/components/rounded_button.dart';
import 'package:akhtbaraty/components/rounded_input_field.dart';
import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/ui/Student/Home//components/background.dart';
import 'package:akhtbaraty/ui/Student/Home/HomeScreen.dart';
import 'package:akhtbaraty/ui/exams/start_exam.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Widget Table () => DataTable(
    onSelectAll: (b){},
    sortColumnIndex: 1,
    sortAscending: true,
    columns: <DataColumn>[
      DataColumn(
        label: Text('Exam Name',),
          numeric: false,
          onSort: (i,b){},
        tooltip: 'To User Login',
      ),
      DataColumn(
        label: Text('Points',),
        numeric: false,
        onSort: (i,b){},
        tooltip: 'The User Point',
      ),
      DataColumn(
        label: Text('Start',),
        numeric: false,
        onSort: (i,b){
        },
        tooltip: 'The User Point',
      ),
    ],
    rows: <DataRow>[
      DataRow(
          cells: <DataCell>[
            DataCell(Text('Math Exam'),),
            DataCell(Text('5')),
            DataCell(IconButton(onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => StartExam()));
            } ,icon:Icon(Icons.not_started, color: kPrimaryColor,),) ),
          ]
      ),
      DataRow(
          cells: <DataCell>[
            DataCell(Text('Sport Exam'),),
            DataCell(Text('9')),
            DataCell(Icon(Icons.not_started, color: kPrimaryColor,)),
          ]
      ),
      DataRow(
          cells: <DataCell>[
            DataCell(Text('Mythology Exam'),),
            DataCell(Text('3')),
            DataCell(Icon(Icons.not_started, color: kPrimaryColor,)),
          ]
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      color: Colors.white,
      child: ListView(
        children: [
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
              child: Container(
                height: size.height * 0.10,
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.65,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 8.0),
                        child: TextField(
                          onTap: () {},
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.join,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignLabelWithHint: false,
                            fillColor: kPrimaryLightColor,
                            filled: true,
                            labelText: 'Exam Number',
                            labelStyle: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'SEARCH',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height:10,),

            Container(
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Table()),
          ],
        ),
        ],
      ),
    );
  }
}


// class Name{
//   String ExamName;
//   int Points;
//   Icon More;
//
//   Name({this.ExamName, this.More, this.Points});
// }
//
// var names = <Name> [
//   Name(ExamName: "sport exam", Points: 4, More: Icon(Icons.not_started, color: kPrimaryColor,)),
//   Name(ExamName: "math exam", Points: 8, More: Icon(Icons.not_started, color: kPrimaryColor,)),
//   Name(ExamName: "greek mythology exam", Points: 4, More: Icon(Icons.not_started, color: kPrimaryColor,)),
// ];