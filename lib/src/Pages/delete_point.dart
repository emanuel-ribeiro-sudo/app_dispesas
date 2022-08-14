import 'package:app_dispesas/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeletePoint extends StatelessWidget {
   DeletePoint({Key? key}) : super(key: key);
  final _points = [
    {'nome':'Point 1', 'data':'23/12/22','dispesas':'9000'},
    {'nome':'Point 2','data':'23/03/22','dispesas':'3000'},
    {'nome':'Point 3','data':'23/12/22','dispesas':'7000'},
    {'nome':'Point 4','data':'23/09/22','dispesas':'8000'},
    {'nome':'Point 5','data':'23/11/22','dispesas':'12000'},
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Pontos'),
      ),
      body: ListView.builder(
          itemCount: _points.length,

          itemBuilder: (context,index){
            return _cardPoints('${_points[index]['nome']}', '${_points[index]['dispesas']}', '${_points[index]['data']}', context);
          })
    );
  }
}

Widget _cardPoints (String nome, String valor, String data,context){
  return Padding(
    padding: const EdgeInsets.only(top: defaultPadding,right: defaultPadding,left: defaultPadding,bottom: 0.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70.withOpacity(0.8),
        boxShadow: const [
          BoxShadow(color: Colors.black, spreadRadius: 0.9,blurRadius: 5.0),
        ],
      ),
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(nome),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Text(data,style: const TextStyle(
                              color: Colors.blue,
                            )),
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Text(valor,textAlign: TextAlign.center),
                      ),
                    )
                  ],
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0,top: 8.0,left:8.0,right: 16),
            child: SizedBox(
              child:  InkWell(
                  borderRadius: BorderRadius.circular(30),
                  highlightColor: Colors.blue.withOpacity(0.4),
                  splashColor: Colors.green.withOpacity(0.9),
                child: const Icon(Icons.delete,color: Colors.deepOrange),
                onTap: ()=> showAlertDialog(context)
              ),
            ),
          )
        ],
      ),
    ),
  );
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    style: TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: primaryColor,
      onSurface: Colors.grey,
    ),
    child: const Text("Nao"),
    onPressed:  () {
      Navigator.pop(context, true);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Sim"),
    onPressed:  () {
      SystemNavigator.pop();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Eliminar"),
    content: const Text("Quer mesmo eliminar este ponto?"),
    actions: [
      cancelButton,
      continueButton,
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