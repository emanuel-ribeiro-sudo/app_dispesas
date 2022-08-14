import 'package:flutter/material.dart';

class Checagem extends StatefulWidget {
  const Checagem({Key? key}) : super(key: key);

  @override
  State<Checagem> createState() => _ChecagemState();
}

class _ChecagemState extends State<Checagem> {
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
