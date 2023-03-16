import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/remote/dio/dio_News.dart';
import 'package:news_app/screens/home_screen.dart';

import 'cubit/Observer/observer.dart';


void main() {
  Bloc.observer = MyBlocObserver();
  DioNews.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //       // statusBarColor: Colors.white
    //     ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
          ) ,
          color: Colors.white,
            elevation:0
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(color: Colors.red),
          selectedLabelStyle: TextStyle(color: Colors.black),

        )
      ),
      home: const HomeScreen(),
    );
  }
}

