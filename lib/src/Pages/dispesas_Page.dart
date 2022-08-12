import 'package:flutter/material.dart';

import '../../constants.dart';

class dispesas extends StatelessWidget {
  final _data=[
    {'Nome': 'Nome1', 'discrisao':'discrisao1'},
    {'Nome': 'Nome2', 'discrisao':'discrisao2'},
    {'Nome': 'Nome3', 'discrisao':'discrisao3'},
    {'Nome': 'Nome4', 'discrisao':'discrisao4'},
    {'Nome': 'Nome5', 'discrisao':'discrisao5'},
    {'Nome': 'Nome6', 'discrisao':'discrisao6'},
    {'Nome': 'Nome6', 'discrisao':'discrisao6'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: GridView.builder(

          itemCount: _data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index)=> _buildCard('${_data[index]["Nome"]}', "${_data[index]['discrisao']}",'assets/1.jpg',index, context)
      ),
      floatingActionButton: const FloatingActionButton(child: Icon(Icons.add),
        onPressed:null
        // ()=> Navigator.push(context,MaterialPageRoute(
        //     builder: (context)=>CreatePoint()))
        ,
      ),
    );
  }
}
Widget _buildCard(String nome, String preco,String imgPath,int tag,context) {
  return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            print('its work');
          }
          ,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Hero(
                    tag: tag,
                    child: Container(
                        height:Heroheight+40,// pesquisar pegar tamanho do componente
                        width: Herowidth+70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.fitWidth)
                        )
                    )
                ),
                const SizedBox(height: 7.0),
                const Divider(height:0.5,),
                const SizedBox(height: 6.0),
                Text(nome,
                    style: const TextStyle(fontFamily: 'Academy Engraved LET',color: Colors.black)),
              ]
              )
          )
      )
  );
}
