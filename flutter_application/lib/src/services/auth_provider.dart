import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential.user);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return 1;
      } else if (e.code == 'email-already-in-use') {
        print('The email is already in use.');
        return 2;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }



Future signInEmailAndPassword(String email, String password) async{
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

    final a = userCredential.user;
    if(a?.uid != null){
      return a?.uid;
    }

  }on FirebaseAuthException catch (e){
    if(e.code == 'user-not-found'){
      print('No user found for that email.');
      return 1;
    }else if(e.code == 'wrong-password'){
      print('Wrong password provided for that user.');
      return 2;
    }
}
}
}