import 'package:flutter/material.dart';
import '../../constants.dart';
import 'login_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                   // image: DecorationImage(image: AssetImage("assets/1.jpg"), fit: BoxFit.cover,),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width:  MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                      children:[
                        const Spacer(),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                          child: SizedBox(
                            width:double.infinity ,
                            child: ElevatedButton(
                              onPressed:  ()=>Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const LoginPage())),
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor
                              ),

                              child: const Text("Sing In"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:double.infinity ,
                          child: ElevatedButton(
                            onPressed: null,
                            style: TextButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                shape: const RoundedRectangleBorder(side: BorderSide(
                                    color: primaryColor
                                ))
                            )
                            ,
                            child: const Text("Sign Up",
                              style: TextStyle(
                                  color: primaryColor
                              ),),
                          ),
                        ),
                        const Spacer()
                      ]
                  ),
                )
              ],
            )
        )
    );

  }
}
