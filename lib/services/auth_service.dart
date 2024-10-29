import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> registerUser(String email, String password, String role) async {
    try {
      final UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore.collection('users').doc(user.user!.uid).set({
        'email': email,
        'role': role,
      });
      return user.user;
    } catch (e) {
      print("Registration Error: $e");
      return null;
    }
  }

  Future<User?> loginUser(String email, String password) async {
    try {
      final UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  Future<String> getUserRole(User user) async {
    DocumentSnapshot doc =
        await _firestore.collection('users').doc(user.uid).get();
    return doc['role'];
  }
}
