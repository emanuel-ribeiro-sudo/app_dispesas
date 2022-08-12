import 'package:app_dispesas/src/Pages/delete_point.dart';
import 'package:app_dispesas/src/Pages/editData_Page.dart';
import 'package:app_dispesas/src/Pages/insertData_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class MenuPage extends StatelessWidget {
   MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: InkWell(
            child:const Icon(Icons.menu,color: Colors.black),
            onTap: (){
              Navigator.pop(context);
            }
        ),
        actions:  [InkWell(child: const Icon(Icons.logout_outlined,color: Colors.black,),
        onTap: ()=>showAlertDialog(context)
        )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:  [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircleAvatar(),
                      Text("Nome")
                    ],
                  )
              ),
              SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
                  child: const ItemDraw()),
            ],
          ),
        ),
      ),
    );
  }
}
class ItemDraw extends StatelessWidget {
  const ItemDraw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: _size.height*0.7,
        child: Column(
          children: [
            const Divider(height:0.5),
            ListTile(
              title: const Text('Inserir Dados',style: style),
              leading: const Icon(Icons.add_circle_outline_outlined,color: Colors.green,),
              trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>const InsertValues()));
                },
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=>const InsertValues()));
              },

            ),
            const Divider(height:0.5,),
             ListTile(
              title: const Text('Editar Dados',style: style),
              leading: const Icon(Icons.edit_outlined,color: secondaryColor,),
              trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=> EditValues()));
                },
              ),
              onTap:() {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> EditValues()));
              },
              //     () {
              //   // Update the state of the app
              //   // ...
              //   // Then close the drawer
              //   Navigator.pop(context);
              //   Navigator.push(context,MaterialPageRoute(
              //       builder: (context)=>EditValues()));
              // },

            ),
            const Divider(height:0.5),
            ListTile(
              title: const Text('Deletar Pontos',style: style),
              leading: const Icon(Icons.delete_outline_outlined,color: remColor,),
              trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=> DeletePoint()));
                },
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> DeletePoint()));
              },
            ),
            const Divider(height:0.5),
              ListTile(
              title: const Text('DashBoard',style: style,),
              leading:  const Icon(Icons.dashboard_outlined,color: Colors.black,),
               trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                 onTap: () {
                   Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(
                       builder: (context)=>const InsertValues()));
                 },
               ),
              onTap: null,
              //     () {
              //   Navigator.pop(context);
              //   Navigator.push(context,MaterialPageRoute(
              //       builder: (context)=>DashBoardPage()));
              // },
            ),
            const Divider(height:0.5),
            ListTile(
              title: const Text('Meus Dados',style: style),
              leading: const Icon(Icons.insert_drive_file_outlined,color: Colors.orangeAccent,),
              trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>const InsertValues()));
                },
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },

            ),
            const Divider(height:0.5),
            const ListTile(
              title: Text('     Emanuel Ribeiro',
                  style: style
              ),
              leading: Icon(Icons.copyright_outlined),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
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
    title: const Text("Logout"),
    content: const Text("Quer sair mesmo?"),
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