import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:sample_flight_management_flutter/ui/signup/signup_controller.dart';

class SignupScreen extends GetView<SignupController> {
  final _formKey = GlobalKey<FormBuilderState>();

  SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'name',
                  decoration: const InputDecoration(labelText: 'Name'),
                  keyboardType: TextInputType.name,
                  validator: (value) => value?.isNotEmpty == true ? null : "Empty",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => value?.isNotEmpty == true ? null : "Empty",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormBuilderTextField(
                  name: 'password',
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) => value?.isNotEmpty == true ? null : "Empty",
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    // print(_formKey.currentState?.saveAndValidate() == true);
                    if (_formKey.currentState?.saveAndValidate() == true) {
                      var name = _formKey.currentState?.value['name'];
                      var email = _formKey.currentState?.value['email'];
                      var password = _formKey.currentState?.value['password'];
                      controller.signup(email: email, password: password, name: name);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
