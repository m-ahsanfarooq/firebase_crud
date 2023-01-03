import 'package:flutter/material.dart';
import '../custom_form_field.dart';
import '../validator/database.dart';
import '../validator/validator.dart';
import 'home.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  const LoginForm({required this.focusNode, Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController textEditingController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
String getId = '';
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
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter User Id',
                    inputAction: TextInputAction.done,
                    lable: 'User ID',
                    validator: (value) {
                      Validator.validatorField(value!);
                      getId = value;
                    },
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
                      DataBase.userId = getId;
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
