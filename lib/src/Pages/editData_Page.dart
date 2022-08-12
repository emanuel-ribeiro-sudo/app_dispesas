import 'package:app_dispesas/src/Pages/Widgets/form_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../constants.dart';

class EditValues extends StatefulWidget {

  @override
  _EditValuesState createState() => _EditValuesState();
}

class _EditValuesState extends State<EditValues> {
  final data=[
    {'discrisao': 'desc1', 'valor':'1234'},
    {'discrisao': 'desc2', 'valor':'121'},
    {'discrisao': 'desc3', 'valor':'12345'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Editar Valores'),centerTitle: true,
        ),
        body:
        Column(
          children: [
            const SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                // padding: EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: DropdownButton(
                  hint: const Text('Selecionar ponto',style: style,),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                  iconSize: 36,
                  underline: const SizedBox(),
                  isExpanded: true,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ), onChanged: null, items: const [],
                )

            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index){
                  var dados = data[index];
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
                      child: ListTile(
                        title: Text('${dados['discrisao']}',style: style,),
                        subtitle: Text('${dados['valor']}',),
                        trailing: Container(width: 100,
                          child: Row(
                            children: [
                              IconButton(onPressed: (){Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> FormEdit(discrisao: dados['discrisao'].toString(),valor: dados['valor'].toString(),)));}, icon: const Icon(Icons.edit,color:secondaryColor)),
                              const SizedBox(width: 10,),
                              const IconButton(onPressed: null, icon:  Icon(Icons.delete,color:Colors.black,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  // return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        )
    );

  }
}
