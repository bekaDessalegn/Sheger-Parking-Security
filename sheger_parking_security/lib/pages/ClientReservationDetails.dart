// ignore_for_file: file_names, prefer_const_constructors, no_logic_in_create_state, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sheger_parking_security/constants/colors.dart';
import 'package:sheger_parking_security/constants/strings.dart';

class ClientReservationDetails extends StatefulWidget {
  String reservationId,
      client,
      reservationPlateNumber,
      branch,
      branchName,
      slot,
      price,
      startingTime,
      duration;
  bool parked;

  ClientReservationDetails(
      {required this.reservationId,
      required this.client,
      required this.reservationPlateNumber,
      required this.branch,
      required this.branchName,
      required this.slot,
      required this.price,
      required this.startingTime,
      required this.duration,
      required this.parked});

  @override
  _ClientReservationDetailsState createState() =>
      _ClientReservationDetailsState(reservationId, client,
          reservationPlateNumber, branch, branchName, slot, price, startingTime, duration, parked);
}

class _ClientReservationDetailsState extends State<ClientReservationDetails> {
  String reservationId,
      client,
      reservationPlateNumber,
      branch,
      branchName,
      slot,
      price,
      startingTime,
      duration;
  bool parked;

  _ClientReservationDetailsState(
      this.reservationId,
      this.client,
      this.reservationPlateNumber,
      this.branch,
      this.branchName,
      this.slot,
      this.price,
      this.startingTime,
      this.duration,
      this.parked);

  late String startTime;
  late String startDate;

  @override
  void initState() {
    super.initState();
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(int.parse(startingTime));
    String startDate = DateFormat.yMMMd().format(startTime);
    String formattedStartTime = DateFormat('h:mm a').format(startTime);
    // String datetime = startingTime.hour.toString().padLeft(2, '0') + ":" + startingTime.minute.toString().padLeft(2, '0');

    this.startTime = formattedStartTime;
    this.startDate = startDate;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Col.background,
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Col.primary,
              offset: Offset(0, 2.0),
              blurRadius: 4.0,
            )
          ]),
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: 60,
            leading: IconButton(
              color: Col.Onbackground,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
            title: Text(
              "Reservation details",
              style: TextStyle(
                color: Col.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                letterSpacing: 0.3,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Col.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: Col.blackColor,
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              letterSpacing: 0.3,
                            ),
                            text: "Reservation at "),
                        TextSpan(
                          style: TextStyle(
                            color: Col.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito',
                            letterSpacing: 0.3,
                          ),
                          text:
                          branchName,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Divider(
                    color: Col.primary,
                    thickness: 2,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Plate number",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  reservationPlateNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  startDate,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Start time",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  startTime,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Duration",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "$duration:00 hours",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Slot",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  slot,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 5, 0, 0),
                child: Text(
                  "Price",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  "$price birr",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Divider(
                    color: Col.primary,
                    thickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
