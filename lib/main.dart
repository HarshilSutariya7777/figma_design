// ignore_for_file: prefer_const_constructors

import 'package:figma_design/FireBaseStore/FirebaseStore.dart';
import 'package:figma_design/Razorpay.dart';
import 'package:figma_design/apicalled.dart';
import 'package:figma_design/camera.dart';
import 'package:figma_design/chase.dart';
import 'package:figma_design/content/ButtonWidget.dart';
import 'package:figma_design/google_auth.dart';
import 'package:figma_design/movie_ui.dart';
import 'package:figma_design/spleshscreem.dart';
import 'package:figma_design/wallpaper.dart';
import 'package:figma_design/widget/First_screen.dart';
import 'package:figma_design/widget/otpscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "high_importnace_channel",
    "High_imprtance_notification",
    "This channel is used for imprtannt notification.",
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> FirebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('A bg message just showerd up: ${message.messageId}');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(FirebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SpleshScreen(),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: "@mipmap/harshil",
            )));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('New onmessage was publish!!!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: "@mipmap/harshil")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomButon(
                  text: "02/01/23",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FirstScreen()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "02/01/23",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MovieScreen()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "02/01/23",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Chese()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "02/01/23",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CamereOpen()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "02/01/23",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ApiCalled()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "Google Auth",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "OTP Screen",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Otp()));
                  }),
              SizedBox(height: 20),
              CustomButon(
                  text: "Wallpaper",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WallPaper()));
                  }),
              SizedBox(height: 20),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              FloatingActionButton(
                onPressed: showNotification,
                child: Icon(Icons.add),
              ),
              SizedBox(height: 20),
              CustomButon(
                  text: "Razorpay",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Payment()));
                  }),
              SizedBox(height: 10),
              CustomButon(
                  text: "Firebase Store",
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Store()));
                  }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
