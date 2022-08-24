import 'package:app_dispesas/src/Pages/checagem_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Car',
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }),
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(displayColor: primaryColor),
          elevatedButtonTheme:
          ElevatedButtonThemeData(style:
          TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.all(defaultPadding)
          ),),
          inputDecorationTheme: InputDecorationTheme(
              border:textFieldBorder,
              enabledBorder:textFieldBorder,
              focusedBorder: textFieldBorder
          )),
      home: const Checagem(),
    );
  }
}

