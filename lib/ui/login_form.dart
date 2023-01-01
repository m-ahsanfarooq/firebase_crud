import 'package:firbase_crud_example/custom_form_field.dart';
import 'package:firbase_crud_example/ui/home.dart';
import 'package:firbase_crud_example/validator/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../validator/database.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  const LoginForm({required this.focusNode, Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController textEditingController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
              child: Column(
                children: [
                  CustomFormField(
                    controller: textEditingController,
                    focusNode: widget.focusNode,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter User Id',
                    inputAction: TextInputAction.done,
                    lable: 'User ID',
                    validator: (value) => Validator.validateUserId(value!),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orangeAccent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  onPressed: () {
                    widget.focusNode.unfocus();
                    if (loginFormKey.currentState!.validate()) {
                      DataBase.userId = textEditingController.text;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.blueGrey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}