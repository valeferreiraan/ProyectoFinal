import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:greenplastic_app/ui/pages/menuPage.dart';

class LoginController extends GetxController {
  //usuario provisional
  /*
  String username_prueba = 'adm@gp.com';
  String password_prueba = '1';
  */

  Map<String, String> usuarios = {
    'adm@gp.com': 'adm',
    'asesor1@gp.com': '1',
    'asesor2@gp.com': '2',
    'asesor3@gp.com': '3'
  };

  var user = ''.obs;
  var pswd = ''.obs;

  var logged = false.obs;

  final userController = TextEditingController();
  final passController = TextEditingController();

  void setEmail(String username) {
    user.value = username;
  }

  void setPass(String pass) {
    pswd.value = pass;
  }

  void login(String user, String pswd) {
    if (user.isEmpty || pswd.isEmpty) {
      Get.snackbar('Error', 'Los campos no pueden estar vacíos',
          icon: Icon(Icons.warning),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1));
    } else {
      if (EmailValidator.validate(user)) {
        if (usuarios.containsKey(user) && usuarios[user] == pswd) {
          Get.off(MenuPage());
          Get.snackbar('Bienvenido', 'GREEN PLASTIC COLOMBIA',
              icon: Icon(Icons.people),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1));
        } else {
          Get.snackbar('Error', 'Correo o contraseña incorrectos',
              icon: Icon(Icons.warning),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1));
        }
      } else {
        Get.snackbar('Error', 'Correo no válido',
            icon: Icon(Icons.warning),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1));
      }
    }
  }

  void resetText() {
    userController.text = '';
    passController.text = '';
  }

  void logOut() {
    logged.value = false;
  }
}
