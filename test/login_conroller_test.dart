import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/ui/controllers/login_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
