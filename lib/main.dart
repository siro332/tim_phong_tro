import 'package:flutter/material.dart';
import 'package:tim_phong_tro/components/class/my_shared_preferences.dart';
import 'package:tim_phong_tro/constants.dart';
import 'package:tim_phong_tro/routes.dart';
import 'package:tim_phong_tro/screens/sign_in/sign_in_screen.dart';
import 'package:tim_phong_tro/screens/splash/splash_screen.dart';

bool isSecondTimeOpen = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool secondTime =
      await MysharedPreferences.instance.getBooleanValue("secondTimeOpen");
  isSecondTimeOpen = secondTime;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute:
          isSecondTimeOpen ? SignInScreen.routeName : SplashScreen.routeName,
      routes: routes,
    );
  }
}

ThemeData theme() {
  return ThemeData(
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
              headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18))),
      inputDecorationTheme: inputDecorationTheme(),
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.green,
      fontFamily: "Muli",
      textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor)));
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10);
  return InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}