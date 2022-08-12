import 'package:app_dispesas/src/Pages/create_point.dart';
import 'package:app_dispesas/src/Pages/menu_Page.dart';
import 'package:app_dispesas/src/Pages/poinstDetails_Page.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

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
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispesas'),
        centerTitle: true,
        leading: InkWell(
          onTap: ()=> Navigator.push(context,MaterialPageRoute(
              builder: (context)=> MenuPage())),
            child: const Icon(Icons.menu)
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: _size.height*0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.20,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                     BoxShadow(color: Colors.red, spreadRadius: 0.5),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 90,

                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.arrow_circle_down,color: remColor,size: 30,),
                                        Text('Dispesas')
                                      ],
                                    ),
                                    const Text(''),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                         Text('10.000'),
                                          ]
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: defaultPadding,),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.green, spreadRadius: 0.5),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: 90,
                                child: Column(
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.arrow_circle_up,color: Colors.green,size: 30,),
                                        Text('Lucro')
                                      ],
                                    ),
                                    const Text(''),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const[
                                        Text('45.000')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*0.8,
                    child: GridView.builder(
                        itemCount: _data.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context,index)=> _buildCard('${_data[index]["Nome"]}', "${_data[index]['discrisao']}",'assets/1.jpg',index, context)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(tooltip:"Criar Pontos",child: const Icon(Icons.add),
        onPressed:()=> Navigator.push(context,MaterialPageRoute(
            builder: (context)=> const CreatePoint())),
      ),
    );
  }
}


Widget _buildCard(String nome, String preco,String imgPath,int tag,context) {
  return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(
                builder: (context)=> PointDetailsPage(data: 'test',nome: 'nome Teste',discrisao: 'discrisao do ponto',localizacao: '12.121313,13.12435',)));
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
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5.0),
                ),
                Hero(
                    tag: tag,
                    child: Container(
                        height:Heroheight,// pesquisar pegar tamanho do componente
                        width: Herowidth,
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