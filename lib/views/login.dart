import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isEmailError = false.obs;
  final RxBool isPasswordError = false.obs;

  void validateForm() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Reset error states
    isEmailError.value = false;
    isPasswordError.value = false;

    if (email.isEmpty) {
      isEmailError.value = true;
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      isEmailError.value = true;
      return;
    }

    if (password.isEmpty) {
      isPasswordError.value = true;
      return;
    }

    // Perform login logic here
  }
}

class LoginScreen extends StatelessWidget {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller.emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _controller.isEmailError.value ? 'Invalid email' : null,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controller.passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _controller.isPasswordError.value ? 'Invalid password' : null,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _controller.validateForm();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: LoginScreen(),
  ));
}
