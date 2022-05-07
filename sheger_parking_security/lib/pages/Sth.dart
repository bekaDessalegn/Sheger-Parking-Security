// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sheger_parking_security/constants/colors.dart';

import 'ClientReservationDetails.dart';

class Sth extends StatefulWidget {

  @override
  _SthState createState() => _SthState();
}

class _SthState extends State<Sth> {
  bool inside = true;

  final textController = TextEditingController();

  checkTextFieldEmpty(){

    String text;

    text = textController.text ;

    if(text.isEmpty)
    {
      return false;
    }else{
      return true;
    }

  }

  dynamic infos = [
    {
      "plateNumber" : "624875",
      "time" : "8:00 A.M",
      "duration" : "3 hrs",
      "inside" : false,
      "isexpired" : false
    },
    {
      "plateNumber" : "215896",
      "time" : "4:00 A.M",
      "duration" : "6 hrs",
      "inside" : true,
      "isexpired" : true
    },
    {
      "plateNumber" : "478563",
      "time" : "7:00 A.M",
      "duration" : "2 hrs",
      "inside" : false,
      "isexpired" : false
    },
    {
      "plateNumber" : "015874",
      "time" : "1:00 A.M",
      "duration" : "4 hrs",
      "inside" : true,
      "isexpired" : false
    },
    {
      "plateNumber" : "624875",
      "time" : "8:00 A.M",
      "duration" : "3 hrs",
      "inside" : true,
      "isexpired" : false
    },
    {
      "plateNumber" : "215896",
      "time" : "4:00 A.M",
      "duration" : "6 hrs",
      "inside" : true,
      "isexpired" : false
    },{
      "plateNumber" : "478563",
      "time" : "7:00 A.M",
      "duration" : "2 hrs",
      "inside" : true,
      "isexpired" : false
    },{
      "plateNumber" : "015874",
      "time" : "1:00 A.M",
      "duration" : "4 hrs",
      "inside" : true,
      "isexpired" : false
    },
    {
      "plateNumber" : "624875",
      "time" : "8:00 A.M",
      "duration" : "3 hrs",
      "inside" : true,
      "isexpired" : true
    },
    {
      "plateNumber" : "215896",
      "time" : "4:00 A.M",
      "duration" : "6 hrs",
      "inside" : true,
      "isexpired" : false
    },{
      "plateNumber" : "478563",
      "time" : "7:00 A.M",
      "duration" : "2 hrs",
      "inside" : true,
      "isexpired" : false
    },{
      "plateNumber" : "015874",
      "time" : "1:00 A.M",
      "duration" : "4 hrs",
      "inside" : true,
      "isexpired" : true
    },
  ];


  @override
  Widget build(BuildContext context) {

    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = checkTextFieldEmpty() ? styleActive : styleHint;

    return Column(
      children: <Widget>[
        Container(
          height: 42,
          margin: EdgeInsets.fromLTRB(16, 5, 16, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.5), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: InputBorder.none,
              icon: Icon(Icons.search, color: style.color),
              suffixIcon: checkTextFieldEmpty() ? GestureDetector(
                child: Icon(Icons.close, color: style.color,),
                onTap: (){
                  setState(() {
                    textController.clear();
                  });
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ) : null,
              hintText: "Search",
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black26,
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Col.Onsurface,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Text("Expired Reservations",
            style: TextStyle(
              color: Col.Onbackground,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
              letterSpacing: 0.1,
            ),
          ),
        ),
        Expanded(child:
        ListView.builder(
          itemCount: infos.length,
          itemBuilder: (context, index) {
            dynamic info = infos[index];
            return (info['isexpired']) as bool ? GestureDetector(child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                color: (info['isexpired']) as bool ? Col.expired : Colors.grey[100],
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 8, 0, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          Align(
                            child: IconButton(onPressed: () {
                              inside = !inside;
                              setState(() => info['inside'] = !inside);
                            },
                              icon: Icon((info['inside']) as bool ? Icons.check : Icons.car_repair,),
                              iconSize: 30,),
                            alignment: Alignment.topRight,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text("Plate Number : ${info["plateNumber"]}",
                              style: TextStyle(
                                color: Col.Onbackground,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("Start time : ${info["time"]}",
                        style: TextStyle(
                          color: Col.Onbackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          letterSpacing: 0.3,
                        ),
                      ),
                      Text("Duration : ${info["duration"]}",
                        style: TextStyle(
                          color: Col.Onbackground,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              ),
            ),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ClientReservationDetails(detail: info,)));
              },
            ) : Padding(padding: EdgeInsets.all(0));
          },
        ),
        ),
      ],
    );
  }
}
