import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/my_home.dart';

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goha',
      theme: ThemeData(
        // primarySwatch: Colors.pink,
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
                headline6: TextStyle(
                  fontSize: 35,
                  // fontFamily: "Lobster",
                  letterSpacing: 3,
                ),
                bodyText2: TextStyle(),
                button: TextStyle(letterSpacing: 3))
            .apply(
          fontFamily: "Lalezar",
        ),
        scaffoldBackgroundColor: Colors.green[200],
        cardColor: Colors.green[100],
      ),
      home: AnimatedSplashScreen(
          duration: 2000,
          splash: Center(
            child: Container(
              height: 600,
              child: Image.asset(
                "assets/images/goha1.jpeg",
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          nextScreen: MyHomePage(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.greenAccent),
    );
  }
}
