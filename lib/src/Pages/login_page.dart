import 'package:flutter/material.dart';

import '../../constants.dart';
import 'createAccount_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool visivel = true;

   @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                // image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
              ),
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,

              child: SafeArea(
                child:  SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [
                      const SizedBox(height: defaultPadding *4,),
                      Text("Login", style: Theme.of(context).textTheme.headline5!.
                      copyWith(fontWeight: FontWeight.bold, color: letra),
                      ),
                      Row(
                          children: [
                            const Text("Nao tem uma conta?",style: TextStyle(color: primaryColor),),
                            TextButton(onPressed: ()=> Navigator.push(context,MaterialPageRoute(
                                builder: (context)=> CreateAccountPage())),
                              child: const Text("Crie uma.",
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                            )
                          ]),
                      Form(
                          key: _formkey,
                          child:SingleChildScrollView (
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: defaultPadding,),
                                const TextFieldNameLogin(text:"Email",),
                                TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(color: letra),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (email) {
                                    if (email == null || email.isEmpty) {
                                      return 'Por favor, degite seu email';
                                    } else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(_emailController.text)) {
                                      return 'Por favor, digite um e-mail valido';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email,color: primaryColor),
                                      alignLabelWithHint: true,
                                      hintText: "test@gmail.com",hintStyle: TextStyle(color: letra.withOpacity(0.2))
                                  ),
                                ),
                                const SizedBox(height: defaultPadding,),
                                const TextFieldNameLogin(text:"Password",),
                                TextFormField(
                                  controller: _passwordController,
                                  style:  TextStyle(color: letra),
                                  obscureText: visivel,
                                  validator: (senha){
                                    if(senha==null || senha.isEmpty) {
                                      return 'Por favor, degite uma senha';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                     prefixIcon: const Icon(Icons.lock,color: primaryColor),
                                      alignLabelWithHint: true,
                                      suffixIcon: InkWell(
                                        onTap: (){
                                          setState(() {
                                            visivel =! visivel;
                                          });
                                        },
                                          child:  Icon(visivel?Icons.remove_red_eye:Icons.circle_outlined,color: primaryColor)),
                                      hintText: "********",hintStyle: TextStyle(color: letra.withOpacity(0.2),)
                                  ),
                                ),
                                const SizedBox(height: defaultPadding,),
                              ],
                            ),
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){},
                            child: const Text("Esqueceu sua senha ?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding *2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed:  ()
                        async {
                          FocusScopeNode curentFocus = FocusScope.of(context);
                          if( _formkey.currentState!.validate()){
                            
                            if(!curentFocus.hasPrimaryFocus){
                              curentFocus.unfocus();
                            }
                          }
                        },
                            child: const Text("Entrar")
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }
}

class TextFieldNameLogin extends StatelessWidget {
  const TextFieldNameLogin({
    Key? key,required this.text
  }):super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(text,
        style: TextStyle(fontWeight: FontWeight.w600, color: letra),
      ),
    );
  }
}
