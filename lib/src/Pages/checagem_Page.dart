import 'dart:async';
import 'package:app_dispesas/src/Pages/homePage.dart';
import 'package:app_dispesas/src/Pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Checagem extends StatefulWidget {
  const Checagem({Key? key}) : super(key: key);

  @override
  State<Checagem> createState() => _ChecagemState();
}

class _ChecagemState extends State<Checagem> {
  StreamSubscription? streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if(user==null){
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context)=>const MyHomePage()));
      }else{
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context)=>  HomePage()));
      }
    }
    );
  }

  @override
  void dispose(){
    streamSubscription!.cancel();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
