import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

enum SignupState {Idle, Busy, Finished, NoData, FinishedWithError}

class SignupController extends GetxController{

  final _isVisibile = true.obs;
  bool get isVisible => _isVisibile.value;
  void setVisibilty() => _isVisibile.value = !_isVisibile.value;

  final _signupState = SignupState.Idle.obs;
  SignupState get loginState => _signupState.value;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Failed to register with email and password: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

}