import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  var firebaseAuth = FirebaseAuth.instance;

  Future<bool> doRegister(String correo, String contrasena) async {
    try {
      final credenciales =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correo,
        password: contrasena,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print('FALLO');
      print(e);
      return false;
    }
  }

  Future<bool> doLogin(String correo, String contrasena) async {
    try {
      final credenciales =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo,
        password: contrasena,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print('FALLO');
      print(e);
      return false;
    }
  }
}
