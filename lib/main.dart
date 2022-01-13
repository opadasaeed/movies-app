import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screen/homescreen/homescreen.dart';

void main() {
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
        splash: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("assets/images/splashscreen2.png",fit: BoxFit.cover,
            ),
          ),
        ) ,
        duration: 2000,
        splashIconSize: double.infinity,
        nextScreen: const HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}


