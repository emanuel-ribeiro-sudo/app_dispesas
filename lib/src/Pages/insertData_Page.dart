import 'package:flutter/material.dart';

import 'Widgets/form_insert.dart';


class InsertValues extends StatefulWidget {
  const InsertValues({Key? key}) : super(key: key);

  @override
  _InsertValuesState createState() => _InsertValuesState();
}

class _InsertValuesState extends State<InsertValues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inserir Valores'),centerTitle: true,),
      body: const FormInsert(),

    );
  }
}