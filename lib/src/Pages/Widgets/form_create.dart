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
          _inputData(hint: "Nome do ponto",estado: true,),
          const SizedBox(
            height: 10,
          ),
          _inputData(hint: "Data Inicio",estado: true),
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
                  child: _inputData(hint: "Localizacao",estado: false,)),
              SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.4,
                  height: 40,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18),
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
  _inputData({
    Key? key, required this.hint,required this.estado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      /*Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        // padding: EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: hint),
            style: style
        ));*/
      Padding(
        padding: const EdgeInsets.only(right: 8,top: 8,left: 8, bottom:0),
        child: TextFormField(
          readOnly: !estado,

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