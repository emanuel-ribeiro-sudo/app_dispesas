
import 'package:flutter/material.dart';

import '../../../constants.dart';

class FormInsert extends StatefulWidget {
  const FormInsert({Key? key}) : super(key: key);

  @override
  State<FormInsert> createState() => _FormInsertState();
}

class _FormInsertState extends State<FormInsert> {
  TextEditingController namecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  List<_inputData> list= [];
  addDynamic(){
    list.add(_inputData());
    setState((){});
  }
  remDynamic(){
    if(list.isNotEmpty) {
      list.removeLast();
    }
    setState((){});
  }
  saveData(){
    for (var element in list) {
      if(element.controllerDiscrisao.text.isEmpty ||element.controllerValor.text.isEmpty){
        return null;
      }else {
        print(element.controllerDiscrisao.text);
        print(element.controllerValor.text);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.create_new_folder,
            size: 50,
            color: primaryColor,
          ),
          const _inputPoint(hint: "Selecionar Ponto",),
          const SizedBox(height: 20),
          Flexible(
              child: Form(
                key: _formkey,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder:(_,index)=>list[index],
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: addDynamic, icon: const Icon(Icons.add)),
              IconButton(onPressed: remDynamic, icon: const Icon(Icons.remove)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 60, right: 60,top: 15,bottom: 10),
            width: MediaQuery.of(context).size.width - 30,
            child: ElevatedButton(onPressed: (){
              FocusScopeNode curentFocus = FocusScope.of(context);
              if( _formkey.currentState!.validate()){
                if(!curentFocus.hasPrimaryFocus){
                  curentFocus.unfocus();
                }
                saveData();
              }
            },
              child: const Text('Salvar'),),
          )
        ],
      ),

    );
  }
}


class _inputPoint extends StatelessWidget {
  final String hint;
  const _inputPoint({
    Key? key,required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        // padding: EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: DropdownButton(
          hint: Text(hint,style: style,),
          dropdownColor: Colors.white,
          icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
          iconSize: 36,
          underline: const SizedBox(),
          isExpanded: true,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16
          ), items: const [], onChanged: null,
        )

    );
  }
}

class _insertValues extends StatelessWidget {
   _insertValues({
    Key? key,
    required this.hint, required this.controller, required this.type,
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
          keyboardType: type,
          decoration: InputDecoration(
               hintText: hint),
          validator: (valor){
            if(valor== null || valor.isEmpty){
              return 'Campos vazios';
            }
            return null;


          },
          style: style
      ),
    );

  }
}

class _inputData extends StatelessWidget {

  _inputData({
    Key? key,
  }) : super(key: key);
  TextEditingController controllerDiscrisao = TextEditingController();
  TextEditingController controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                child: _insertValues(hint: "Discricao",controller: controllerDiscrisao,type: TextInputType.text,)),
            SizedBox(
                // height: MediaQuery
                //     .of(context)
                //     .size
                //     .height*0.06,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                child: _insertValues(hint: "Valor",controller: controllerValor,type: TextInputType.number,)),
            // PopupMenuButton(
            //     icon:Icon(Icons.more_vert),
            //     itemBuilder: (context)=>[
            //   PopupMenuItem(child: ListTile(
            //     title: Text("Remover"),
            //     onTap: (){},
            //
            //   ))
            // ])
          ] ,
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

