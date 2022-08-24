import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _firebaseAuth = FirebaseAuth.instance;

  String nome = '';

  String email = '';

  @override
  void initState() {
    pegarUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  const [
                Text('Editar Perfil',textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor,fontSize: 24)
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 74,
                    backgroundColor: primaryColor,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('assets/images/profile1.png'),
                    ),
                  ),
                ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: AdvancedAvatar(
              //     size: 134,
              //     statusSize: 16,
              //     statusColor: Colors.green,
              //     image: AssetImage('assets/images/profile1.png'),
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // )
              ],
            ),
          ),
          const Text('Nome',style: TextStyle(color: Colors.grey)),
          ListTile(
            title: Text(nome),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black),
          ),
          const Divider(height: 2,indent: 10,endIndent: 10,color: Colors.black,),
          const SizedBox(height:10),
          const Text('Email',style: TextStyle(color: Colors.grey)),
          ListTile(
            title: Text(email),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.black),
          ),
          const Divider(height: 2,indent: 10,endIndent: 10,color: Colors.black,)
        ],
      )
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

