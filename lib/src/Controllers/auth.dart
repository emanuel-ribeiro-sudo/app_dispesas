import 'package:firebase_auth/firebase_auth.dart';

final _firebaseAuth = FirebaseAuth.instance;

Future<dynamic> login(String email, String password) async {
  try{
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    if(userCredential != null){
      return 0;
    }
  }on FirebaseAuthException catch(e){
    if(e.code == 'user-not-found'){
      return 1;
    }else if (e.code == 'wrong-password'){
      return 2;
    }
  }
  return 78;
}