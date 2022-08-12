import 'package:flutter/material.dart';

import '../../constants.dart';
import 'login_page.dart';

class CreateAccountPage  extends StatefulWidget {

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _biController= TextEditingController();

  final _nomeController= TextEditingController();

  final _emailController= TextEditingController();

  final _senhaController= TextEditingController();

  final _senha2Controller= TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
        ),
        height: MediaQuery.of(context).size.height,
        width:  MediaQuery.of(context).size.width,

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start ,
              children: [
                const SizedBox(height: defaultPadding*4,),
                Text("Criar Conta", style: Theme.of(context).textTheme.headline5!.
                copyWith(fontWeight: FontWeight.bold, color: letra),
                ),
                const SizedBox(height: defaultPadding,),
                Row(
                  children: [
                    const Text("Ja tem uma conta?",style: TextStyle(color: primaryColor)),
                    TextButton(onPressed: () => Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>const LoginPage(),)
                    ),
                      child: const Text("Entre",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
                Form(
                    key:_formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text:"Email",),
                        TextFormField(
                          controller: _emailController,
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
                          style: const TextStyle(color:letra),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "test@gmail.com",hintStyle: TextStyle(color: letra.withOpacity(0.2))
                          ),
                        ),
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text:"Nome",),
                        TextFormField(
                          controller: _nomeController,
                          validator: (nome){
                            if(nome==null || nome.isEmpty){
                              return 'Por favor, degite um nome';
                            }else if(nome.length<1){
                              return 'Por favor, degite um nome valido';
                            }
                            return null;
                          },
                          style: const TextStyle(color: letra),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Ex: Jose Alves",hintStyle: TextStyle(color: letra.withOpacity(0.2))
                          ),
                        ),
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text:"Senha",),
                        TextFormField(
                          controller: _senhaController,
                          validator: (senha){
                            if(senha==null || senha.isEmpty){
                              return 'Por favor, degite uma senha';
                            }else if(senha.length<4){
                              return 'Por favor, degite uma senha maior igual a 4 caracteres';
                            }
                            return null;
                          },
                          style:  TextStyle(color: letra),
                          obscureText: true,
                          decoration:  InputDecoration(
                              alignLabelWithHint: true,
                              suffixIcon: const InkWell(
                                  onTap: null,
                                  child:  Icon(Icons.remove_red_eye,color: primaryColor)),
                              hintText: "********",hintStyle: TextStyle(color: letra.withOpacity(0.2))
                          ),
                        ),
                        const SizedBox(height: defaultPadding,),
                        const TextFieldName(text:"Confirmar Senha",),
                        TextFormField(
                          controller: _senha2Controller,
                          validator: (senha2){
                            if(senha2==null || senha2.isEmpty){
                              return 'Por favor, degite uma senha';
                            }else if(senha2.length<4){
                              return 'Por favor, degite uma senha ,maior igual a 4 caracteres';
                            }else if(_senhaController.text != _senha2Controller.text){
                              return 'Senhas nao correspondem';
                            }
                            return null;
                          },
                          style: const TextStyle(color: letra),
                          obscureText: true,
                          decoration:  InputDecoration(
                              alignLabelWithHint: true,
                              suffixIcon: const InkWell(
                                  onTap: null,
                                  child:  Icon(Icons.remove_red_eye,color: primaryColor)),
                              hintText: "********",hintStyle: TextStyle(color: letra.withOpacity(0.2))
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(height: defaultPadding *2,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed:  () async {
                    FocusScopeNode curentFocus = FocusScope.of(context);
                    if( _formkey.currentState!.validate()){

                      if(!curentFocus.hasPrimaryFocus){
                        curentFocus.unfocus();
                      }
                    }
                  },
                      // style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: const Text("Registrar")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
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
