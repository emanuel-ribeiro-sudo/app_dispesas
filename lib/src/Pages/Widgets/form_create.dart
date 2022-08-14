import 'package:app_dispesas/constants.dart';
import 'package:flutter/material.dart';

class FormCreate extends StatelessWidget {
  FormCreate({Key? key}) : super(key: key);
  TextEditingController Namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Icon(
            Icons.folder,
            size: 50,
            color: primaryColor,
          ),
          const SizedBox(
            height: 20,
          ),
          _inputData(hint: "Nome do ponto",estado: true,type:TextInputType.text,),
          const SizedBox(
            height: 10,
          ),
          _inputData(hint: "Data Inicio",estado: true,type: TextInputType.datetime),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.6,
                  child: _inputData(hint: "Localizacao",estado: false,type: TextInputType.number)),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  height: 51,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8,left: 0,top: 2,bottom: 2),
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text('Localizacao',style: style),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const _inputDescrisao(),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 60, right: 60,top: 15),
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(
              onPressed: (){ },child: const Text('Registrar',style: style,),),
          )
        ],
      ),
    );
  }
}





class _inputData extends StatelessWidget {
  final String hint;
  final bool estado;
  TextInputType type;
  _inputData({
    Key? key, required this.hint,required this.estado, required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 8,top: 8,left: 8, bottom:0),
        child: TextFormField(
          readOnly: !estado,
          // controller: _emailController,
          style: const TextStyle(color: letra),
          keyboardType: type,
          // validator: (email) {
          //   if (email == null || email.isEmpty) {
          //     return 'Por favor, degite seu email';
          //   } else if (!RegExp(
          //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          //       .hasMatch(_emailController.text)) {
          //     return 'Por favor, digite um e-mail valido';
          //   }
          //   return null;
          // },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              hintText: hint,hintStyle: TextStyle(color: letra.withOpacity(0.2))
          ),
        ),
      );
  }

}

class _inputDescrisao extends StatelessWidget {

  const  _inputDescrisao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 6,
        // controller: _emailController,
        style: const TextStyle(color: letra),
        keyboardType: TextInputType.emailAddress,
        // validator: (email) {
        //   if (email == null || email.isEmpty) {
        //     return 'Por favor, degite seu email';
        //   } else if (!RegExp(
        //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        //       .hasMatch(_emailController.text)) {
        //     return 'Por favor, digite um e-mail valido';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: "Discrisao",hintStyle: TextStyle(color: letra.withOpacity(0.2))
        ),
      ),
    );
  }
}