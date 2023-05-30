import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/controllers/login_controller.dart';
import '../pages/menuPage.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();
  final LoginController _loginCon = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/GreenPlastic.png',
            width: 300,
            height: 300,
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: TextFormField(
              controller: _textController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: Color3,
              style: Theme.of(context).textTheme.bodyMedium,
              onChanged: (user) => _loginCon.setEmail(user),
              onSaved: (user) {
                debugPrint(user);
              },
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: Color3,
                hintText: "USUARIO",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Color3,
              onChanged: (pswd) => _loginCon.setPass(pswd),
              onSaved: (pswd) {
                debugPrint(pswd);
              },
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: Color3,
                hintText: "CONTRASEÑA",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.lock),
                ),
              ),
              onFieldSubmitted: (_) {
                _login(); // Llamar a la función de inicio de sesión al presionar Enter
              },
            ),
          ),
          SizedBox(
              width: 250,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    _loginCon.login(_loginCon.currentuser.value, _loginCon.pswd.value);
                  },
                  child: Text(
                    'CONTINUAR',
                    style: Theme.of(context).textTheme.labelLarge,
                  ))),
        ],
      ),
    ));
  }

  void _login() {
    _loginCon.login(_loginCon.currentuser.value, _loginCon.pswd.value);
  }
}
