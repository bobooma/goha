import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_quotes/data/quotes_data.dart';
import 'package:provider/provider.dart';

import 'screens/my_home.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuotesData>(
        create: (context) => QuotesData(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            textTheme: const TextTheme(
                    headline6: TextStyle(
                      fontSize: 35,
                      // fontFamily: "Lobster",
                      letterSpacing: 2,
                    ),
                    bodyText2: TextStyle(),
                    button: TextStyle(letterSpacing: 3))
                .apply(
              fontFamily: "Lobster",
            ),
            scaffoldBackgroundColor: Colors.pink[300],
            cardColor: Colors.pink[100],
          ),
          home: MyHomePage(),
        ));
  }
}
