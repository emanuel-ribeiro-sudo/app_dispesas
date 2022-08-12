import 'package:app_dispesas/src/Pages/Widgets/form_create.dart';
import 'package:flutter/material.dart';
class CreatePoint extends StatefulWidget {
  const CreatePoint({Key? key}) : super(key: key);

  @override
  _CreatePointState createState() => _CreatePointState();
}

class _CreatePointState extends State<CreatePoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Ponto'),centerTitle: true),
      body: Center(child: FormCreate(),
      )
    );
  }
}