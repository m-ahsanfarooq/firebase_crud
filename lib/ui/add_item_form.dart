import 'package:flutter/material.dart';
import '../custom_form_field.dart';
import '../validator/database.dart';
import '../validator/validator.dart';

class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm(
      {required this.titleFocusNode,
      required this.descriptionFocusNode,
      Key? key})
      : super(key: key);

  @override
  State<AddItemForm> createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final addItemFormKey = GlobalKey<FormState>();
  bool isProcessing = false;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String getTitle = '';
  String getDescription = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addItemFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Title',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  CustomFormField(
                    isLableEnabled: false,
                    controller: titleController,
                    focusNode: widget.titleFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validatorField(value!);
                      getTitle = value;
                    },
                    lable: 'Title',
                    hintText: 'Write your title',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  CustomFormField(
                    maxLine: 10,
                    isLableEnabled: false,
                    controller: descriptionController,
                    focusNode: widget.descriptionFocusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    validator: (value) {
                      Validator.validatorField(value!);
                      getDescription = value;
                    },
                    lable: 'Description',
                    hintText: 'Write your Description',
                  ),
                ],
              ),
            ),
            isProcessing
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        widget.titleFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();

                        if(addItemFormKey.currentState!.validate()){
                          setState(() {
                            isProcessing = true;
                          });
                          await DataBase.addItem(title: getTitle, description: getDescription);

                          setState(() {
                            isProcessing =false;
                          });
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orangeAccent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          'Add Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: 2,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
