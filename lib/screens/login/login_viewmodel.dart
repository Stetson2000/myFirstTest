import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_exam/screens/homepage/home_screen.dart';
import 'package:map_exam/service/firebase_service.dart';

class LoginViewModel extends GetxController {
  FireBaseApi fireBaseApi = FireBaseApi();

  login(String u, String p, BuildContext context) async {
    UserCredential? user = await fireBaseApi.signInWithEmailAndPassword(u, p);
    if (user != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen(),settings: RouteSettings(arguments: user.user?.uid)));
    }
  }
}
