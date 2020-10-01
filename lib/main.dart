import 'package:Bill/helper/custom_route.dart';
import 'package:Bill/helper/splash.dart';
import './providers/infomation.dart';
import 'package:Bill/screens/fifth.dart';
import 'package:Bill/screens/first.dart';
import 'package:Bill/screens/four.dart';
import 'package:Bill/screens/third.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Information(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.amber,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              TargetPlatform.android: CustomPageTransationBuilder(),
              TargetPlatform.iOS: CustomPageTransationBuilder()
            })),
        home: Splash(),
        routes: {
          First.routeName: (ctx) => First(),
          Fifth.routeName: (ctx) => Fifth(),
          Second.routeName: (ctx) => Second(),
          Third.routeName: (ctx) => Third(),
          Four.routeName: (ctx) => Four(),
        },
      ),
    );
  }
}
