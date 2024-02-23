import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginState {Idle, Busy, Finished, NoData, FinishedWithError}

class LoginController extends GetxController {

  //final ApiProvider _apiProvider = ApiProvider();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();
  final TextEditingController passwdFieldController = TextEditingController();


  final _isVisibile = true.obs;
  bool get isVisible => _isVisibile.value;
  void setVisibilty() => _isVisibile.value = !_isVisibile.value;


  final _loginState = LoginState.Idle.obs;
  LoginState get loginState => _loginState.value;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Box? myAppBox;

  @override
  void onInit() {
    //myAppBox = Hive.box("myAppBox");
    super.onInit();
  }

  @override
  void onClose() {
    emailFieldController.dispose();
    passwdFieldController.dispose();
    super.onClose();
  }

  Future<User?> login(String email, String password, BuildContext context) async{
    _loginState.value = LoginState.Busy;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User ${userCredential.user!.email.toString()}");
      _loginState.value = LoginState.Finished;
      return userCredential.user;
    } catch (e) {
      print("Failed to sign in with email and password: $e");
      _loginState.value = LoginState.FinishedWithError;
      return null;
    }
  }
}
