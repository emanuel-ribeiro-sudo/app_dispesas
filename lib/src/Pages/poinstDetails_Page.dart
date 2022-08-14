import 'package:flutter/material.dart';
import '../../constants.dart';

class PointDetailsPage extends StatelessWidget {
    PointDetailsPage({Key? key,required this.nome,required this.data,this.discrisao, this.localizacao}) : super(key: key);
  final nome, data, localizacao, discrisao;
  final example=[
    {'discrisao': 'desc1', 'valor':'1234'},
    {'discrisao': 'desc2', 'valor':'121'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
    {'discrisao': 'desc3', 'valor':'12345'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70.withOpacity(0.1),
        shadowColor: Colors.white70.withOpacity(0.9),
        foregroundColor: Colors.white70.withOpacity(0.1),
        shape: Border.all(color: Colors.white70.withOpacity(0.9),),
        leading: InkWell(
            child:const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black),
            onTap: (){
              Navigator.pop(context);
            }
        ),
        actions:  [
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: (){
            showAlertDialog(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5),
            child:  Text('Fechar Ponto',textAlign: TextAlign.center,
                style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16)),
          ),
        )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Colors.white70.withOpacity(0.9),
                boxShadow: const [
                  BoxShadow(color: Colors.black, spreadRadius: 0.1,blurRadius: 1.0),
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nome:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                        const SizedBox(width: 4,),
                        Text(nome),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Data:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                        const SizedBox(width: 4,),
                        Text(data),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Localizacao:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                        const SizedBox(width: 4,),
                        InkWell(
                          onTap: null,
                            child: Text(localizacao,style: const TextStyle(
                                color: primaryColor,
                                fontStyle: FontStyle.italic,decoration: TextDecoration.underline
                            ))),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Discrisao:',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                        const SizedBox(width: 4,),
                        Text(discrisao),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    itemCount: example.length,
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white70.withOpacity(0.9),
                        boxShadow: const [
                          BoxShadow(color: Colors.black, spreadRadius: 0.1,blurRadius: 1.0),
                        ],
                      ),
                      child:  ListTile(
                        title: Text('${example[index]['discrisao']}',style: style,),
                        trailing: Text('${example[index]['valor']}'),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: const ListTile(
                title: Text('Total',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16)),
                trailing: Text('1234',style: TextStyle(color: primaryColor,fontStyle: FontStyle.italic)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  final _formkey = GlobalKey<FormState>();
  final _lucroController = TextEditingController();
  Widget cancelButton = TextButton(
    child: const Text("Nao"),
    onPressed:  () {
      Navigator.pop(context, true);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Sim"),
    onPressed:  () {
      FocusScopeNode curentFocus = FocusScope.of(context);

      if( _formkey.currentState!.validate()){
        if(!curentFocus.hasPrimaryFocus){
          curentFocus.unfocus();
        }
        //fucao aqui
      }
    },
  );
  Widget insertData = Form(
      key: _formkey,
      child: TextFormField(
        decoration: const InputDecoration(
             hintText: 'Valor Lucro'),
        style: const TextStyle(
          fontFamily: "Academy Engraved LET",
          fontSize: 13,
        ),
        keyboardType: TextInputType.number,
        controller: _lucroController,
        validator: (lucro){
          if(lucro == null || lucro.isEmpty ){
            return 'Campo vaizo';
          }
          return null;
        },
      )
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    scrollable: true,
    title: const Text("Fechar Ponto"),
    content: const Text("Quer mesmo fechar ponto?"),
    actions: [
      Column(
        children: [
          insertData,
          Row(
            children: [
              cancelButton,
              continueButton,
            ],
          ),
        ],
      ),
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
