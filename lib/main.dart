import 'package:assingment/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),


          appBarTheme: const AppBarTheme(
              color: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),titleTextStyle:TextStyle(
            backgroundColor: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ) ),

        ),
        home:  LandingPage(),

    );
  }
}


