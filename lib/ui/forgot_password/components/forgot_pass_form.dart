import 'package:ebook/components/custom_surfix_icon.dart';
import 'package:ebook/components/form_error.dart';
import 'package:ebook/components/no_account_text.dart';
import 'package:ebook/widgets/constants.dart';
import 'package:flutter/material.dart';


class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              bool emailValid = RegExp("^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9\.]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})\$").hasMatch(value!.trim());
              //bool emailValid = RegExp("^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})\$").hasMatch(value!.trim());
              if(value.isEmpty) {
                return "Please enter valid email";
              }
              else if(!emailValid) {
                return "Please enter valid email";
              }
            },
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: const Text('Email'),
              hintText: 'Enter Email',
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12, // Default border color
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 8),
          FormError(errors: errors),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
            child: const Text("Continue"),
          ),
          const SizedBox(height: 16),
          const NoAccountText(),
        ],
      ),
    );
  }
}
