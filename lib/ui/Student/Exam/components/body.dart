import 'package:akhtbaraty/components/constants.dart';
import 'package:akhtbaraty/ui/Teacher/Home//components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  createAlertDilog(BuildContext context){

    AlertDialog  alert = AlertDialog(
      title: Text('MORE', style: TextStyle( color: kPrimaryColor, fontWeight: FontWeight.bold),),

      content: Container(
          height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text('EXAM REVIEW', ),
                  Icon(Icons.preview_outlined,  color: kPrimaryColor),
          ],
        ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('STUDENT RANKING', ),
                Icon(Icons.track_changes_rounded,  color: kPrimaryColor),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DATE & TIME', ),
                Icon(Icons.date_range, color: kPrimaryColor,),
              ],
            ),

       ],
      ),
    ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context){
      return alert;
    },
    );

  }


  Widget Table() =>
      DataTable(
        onSelectAll: (b) {},
        sortAscending: true,
        columns: <DataColumn>[
          DataColumn(
            label: Text('EXAM\nNAME', textAlign: TextAlign.center,),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'To User Login',
          ),
          DataColumn(
            label: Text('EXAM\nPoints', textAlign: TextAlign.center,),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'The User Point',
          ),
          DataColumn(
            label: Text('MORE',  textAlign: TextAlign.center,),
            numeric: false,
            onSort: (i, b) {},
            tooltip: 'The User Point',
          ),
        ],
        rows: <DataRow>[
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Math Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('9',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(IconButton(icon: Icon(Icons.more_horiz,), color: kPrimaryColor, onPressed: (){
                  return createAlertDilog(context);
                }

                ),
                ),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Arabic Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('10',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Germany Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('4',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('History Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('7',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Sport Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('10',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Physics Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('5',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Chemistry Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('4',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
          DataRow(
              cells: <DataCell>[
                DataCell(Text('Counting Exam', style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor,),),),
                DataCell(Text('8',style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),)),
                DataCell(Center(child: Icon(Icons.more_horiz, color: kPrimaryColor,))),
              ]
          ),
        ],
      );



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25, right: 8, left: 8, bottom: 25),
            child: Text('STUDENT EXAMS', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: kPrimaryColor),),
          ),
          SizedBox(height: 15,),

          Padding(
            padding: EdgeInsets.all(3.0),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Exam Details
                  Container(
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Table()),

                  SizedBox(height: 30,),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


