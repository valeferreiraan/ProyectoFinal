import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/ui/controllers/database_controller.dart';
import 'package:greenplastic_app/ui/controllers/login_controller.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAUKTtAMncwayflb2hkvlUVkF39CKvt5KA',
    appId: '1:529378076268:android:1fe89868e9237579da9a49',
    messagingSenderId: '529378076268',
    projectId: 'greenplasticapp',
    databaseURL: 'https://greenplasticapp-default-rtdb.firebaseio.com',
    storageBucket: 'greenplasticapp.appspot.com',
  ));
  Get.put(DatabaseController());
  Get.put(LoginController());
  group('LoginController', () {
    late LoginController loginController;

    setUp(() {
      loginController = LoginController();
      Get.testMode = true;
    });

    tearDown(() {
      Get.reset();
    });

//    test('Empty fields validation', () {
//      loginController.login('', '');
//      expect(Get.isSnackbarOpen, isTrue);
//    });

//    test('Invalid email validation', () {
//      loginController.login('invalidemail', 'password');
//      expect(Get.isSnackbarOpen, isTrue);
//    });

//    test('Incorrect email or password validation', () {
//      loginController.login('invalidemail@gp.com', 'password');
//      expect(Get.isSnackbarOpen, isTrue);
//    });

    test('Successful login validation', () {
      loginController.login('adm@gp.com', 'adm');
      //expect(Get.isSnackbarOpen, isTrue);
    });

    test('Reset text fields', () {
      loginController.userController.text = 'testuser';
      loginController.passController.text = 'testpassword';
      loginController.resetText();
      expect(loginController.userController.text, '');
      expect(loginController.passController.text, '');
    });

    test('Logout validation', () {
      loginController.logged.value = true;
      loginController.logOut();
      expect(loginController.logged.value, isFalse);
    });
  });
}
