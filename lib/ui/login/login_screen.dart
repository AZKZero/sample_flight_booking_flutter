import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Obx(() {
              var buffer = controller.apiBuffer.value;
              return buffer!=null? Text(buffer):const SizedBox(height: 1,);
            }),
          TextFormField(
            // enabled: controller.apiLoading.value,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
              onPressed: () {
                controller.login(
                    email: emailController.text,
                    password: passwordController.text);
              },
              child: const Text('Login')),
        ],
      ),
    );
  }
}
