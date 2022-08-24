import 'package:app_dispesas/src/Pages/delete_point.dart';
import 'package:app_dispesas/src/Pages/editData_Page.dart';
import 'package:app_dispesas/src/Pages/insertData_Page.dart';
import 'package:app_dispesas/src/Pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

import '../../constants.dart';
import 'checagem_Page.dart';

final _firebaseAuth = FirebaseAuth.instance;
class MenuPage extends StatefulWidget {


  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  String nome = '';
  String email = '';
  @override
  void initState() {
    pegarUsuario();
    super.initState();
  }
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
                    children:  [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AdvancedAvatar(
                          size: 134,
                          statusSize: 16,
                          statusColor: Colors.green,
                          image: AssetImage('assets/images/profile1.png'),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(email,style: const TextStyle(
                            color: primaryColor,fontWeight: FontWeight.bold,fontSize: 16
                        ),),
                      ),
                      Text(nome),
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
  pegarUsuario() async{
    User? usuario = await _firebaseAuth.currentUser;
    if(usuario != null){
      setState(() {
        email = usuario.email!;
        nome = usuario.displayName!;
      });
    }
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
            const Divider(height:0.5,thickness: 1,),
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
            const Divider(height:0.5,thickness: 1,),
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
            ),
            const Divider(height:0.5,thickness: 1,),
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
            const Divider(height:0.5,thickness: 1,),
              ListTile(
              title: const Text('DashBoard',style: style,),
              leading:  const Icon(Icons.dashboard_outlined,color: Colors.black,),
               trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                 onTap: () {
                   Navigator.pop(context);
                   Navigator.push(context,MaterialPageRoute(
                       builder: (context)=> Profile()));
                 },
               ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                builder: (context)=> Profile()));
              }
            ),
            const Divider(height:0.5,thickness: 1,),
            ListTile(
              title: const Text('Meus Dados',style: style),
              leading: const Icon(Icons.insert_drive_file_outlined,color: Colors.orangeAccent,),
              trailing: InkWell(child: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,MaterialPageRoute(
                      builder: (context)=> Profile()));
                },
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                    builder: (context)=> Profile()));
              },

            ),
            const Divider(height:0.5,thickness: 1,),
            const ListTile(
              title: Text('Emanuel Ribeiro',
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


  sair() async{
    await _firebaseAuth.signOut().then((then) =>
        Navigator.pushReplacement(context,MaterialPageRoute(
            builder: (context)=> const Checagem()))
    );
  }
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
      sair();
      // SystemNavigator.pop();
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