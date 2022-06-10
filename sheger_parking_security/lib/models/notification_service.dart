// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:async';
import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sheger_parking_security/constants/api.dart';
import 'package:sheger_parking_security/pages/ExpectedPage.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

import 'ReservationDetails.dart';

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationDetails _androidNotificationDetails =
  AndroidNotificationDetails(
    'channel ID',
    'channel name',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  // Future<void> showNotifications() async {
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     "Expired Reservation",
  //     "A customer with plate number 2467896 has expired!",
  //     NotificationDetails(android: _androidNotificationDetails),
  //   );
  // }

  // List<ReservationDetails> reservations = [];
  // String query = '';
  // Timer? debouncer;

  // static Future<List<ReservationDetails>> getReservationDetails(String query) async {
  //   final url = Uri.parse(
  //       '${base_url}/token:qwhu67fv56frt5drfx45e/reservations');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final List reservationDetails = json.decode(response.body);
  //
  //     return reservationDetails.map((json) => ReservationDetails.fromJson(json)).where((reservationDetail) {
  //       final reservationPlateNumberLower = reservationDetail.reservationPlateNumber.toLowerCase();
  //       final branchLower = reservationDetail.branchName.toLowerCase();
  //       final searchLower = query.toLowerCase();
  //
  //       return reservationPlateNumberLower.contains(searchLower) ||
  //           branchLower.contains(searchLower);
  //     }).toList();
  //   } else {
  //     throw Exception();
  //   }
  // }

  Future<void> scheduleNotifications() async {

    // final reservationDetails = await getReservationDetails(query);
    //
    // this.reservations = reservationDetails;
    //
    // var reservationDetail;
    //
    // for(int index = 0; index <= reservations.length; index++){
    //   reservationDetail = reservations[index];
    // }

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Expired Reservation",
        "Plate Number : 68103 has expired!",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 10)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }

  // Future<void> cancelNotifications(int id) async {
  //   await flutterLocalNotificationsPlugin.cancel(id);
  // }
  //
  // Future<void> cancelAllNotifications() async {
  //   await flutterLocalNotificationsPlugin.cancelAll();
  // }
}

Future selectNotification(String payload) async {
  //handle your logic here
}
