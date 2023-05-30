import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:greenplastic_app/ui/controllers/database_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAUKTtAMncwayflb2hkvlUVkF39CKvt5KA',
    appId: '1:529378076268:android:1fe89868e9237579da9a49',
    messagingSenderId: '529378076268',
    projectId: 'greenplasticapp',
    databaseURL: 'https://greenplasticapp-default-rtdb.firebaseio.com',
    storageBucket: 'greenplasticapp.appspot.com',
  ));
  Get.put(DatabaseController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Plastic App',
      theme: ThemeData(
        colorScheme: flexSchemeLight,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.quicksand(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
          ),
          bodyLarge: GoogleFonts.quicksand(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
          bodySmall: GoogleFonts.quicksand(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: GoogleFonts.righteous(
            fontSize: 45.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            shadows: [
              Shadow(blurRadius: 2.0, color: Color1, offset: Offset(1.0, 1.0))
            ],
          ),
          labelLarge: GoogleFonts.quicksand(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        primaryTextTheme: GoogleFonts.quicksandTextTheme(),
        scaffoldBackgroundColor: backColor,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
