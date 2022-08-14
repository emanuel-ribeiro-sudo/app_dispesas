import 'package:flutter/material.dart';

import '../../../constants.dart';

class FormEdit extends StatefulWidget {
  FormEdit({Key? key,required this.discrisao,required this.valor}) : super(key: key);
  var discrisao;
  var valor;
  @override
  _FormEditState createState() => _FormEditState();

}

class _FormEditState extends State<FormEdit> {
  TextEditingController discrisaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    discrisaoController.text = widget.discrisao;
    valorController.text = widget.valor;
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.folder,
              size: 50,
              color: primaryColor,
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _insertValues(hint: "Discrisao ",controller: discrisaoController,type: TextInputType.text),
                  const SizedBox(height: 20,),
                  _insertValues(hint: "Valor",controller: valorController,type: TextInputType.number),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60, right: 60,top: 15),
              width: MediaQuery.of(context).size.width - 30,
              child: ElevatedButton(onPressed: (){
                FocusScopeNode curentFocus = FocusScope.of(context);
                if( _formkey.currentState!.validate()){
                  if(!curentFocus.hasPrimaryFocus){
                    curentFocus.unfocus();
                  }
                  Navigator.pop(context);
                }
              },
                child: const Text('Salvar',style: style,),),
            )
          ],
        ),
      ),
    );
  }
}

class _insertValues extends StatelessWidget {
  const _insertValues({
    Key? key,
    required this.hint,required this.controller, required this.type,
  }) : super(key: key);
  final TextEditingController controller;
  final String hint;
  final TextInputType type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:0,left: 8.0,right: 8.0,top: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint),
        style: const TextStyle(
          fontFamily: "Academy Engraved LET",
          fontSize: 13,
        ),
        keyboardType: type,
        validator: (valor){
          if(valor == null || valor.isEmpty ){
            return 'Campo vaizo';
          }
          return null;
        },
      ),
    );
  }
}

