import 'package:firbase_crud_example/ui/login_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uiFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> _uiFocusNode.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 40),
                        Flexible(
                            child: Image.network(
                          'https://miro.medium.com/max/300/1*R4c8lHBHuH5qyqOtZb3h-w.png',
                          height: 240,
                        )),
                        const SizedBox(height: 20),
                        const Text(
                          'Flutter Firebase',
                          style: TextStyle(color: Colors.amberAccent,fontSize: 40),
                        ),
                        const Text(
                          'Crud',
                          style: TextStyle(color: Colors.orangeAccent,fontSize: 30),
                        ),
                      ],
                    )),
                    FutureBuilder(
                        future: _initializeFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                                'Error occurred while initializing firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return LoginForm(focusNode: _uiFocusNode);
                          }
                          return const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orangeAccent),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
