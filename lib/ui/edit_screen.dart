import 'package:firebase_crud_example/ui/appbar.dart';
import 'package:firebase_crud_example/ui/edit_item_form.dart';
import 'package:firebase_crud_example/validator/database.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentId;

  const EditScreen(
      {required this.currentTitle,
      required this.currentDescription,
      required this.documentId,
      Key? key})
      : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        titleFocusNode.unfocus();
        descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF2C384A),
        appBar: AppBar(
          title: const CustomAppBar(
            sectionName: 'CRUD',
          ),
          actions: [
            isDeleting
                ? const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 16),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent),
                      strokeWidth: 3,
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        isDeleting = true;
                      });
                      await DataBase.deleteItem(documentId: widget.documentId);
                      setState(() {
                        isDeleting = false;
                      });
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.redAccent,
                      size: 32,
                    ))
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: EditItemForm(
            documentId: widget.documentId,
            titleFocusNode : titleFocusNode,
            descriptionFocusNode: descriptionFocusNode,
            currentTitle: widget.currentTitle,
            currentDescription: widget.currentDescription,
          ),
        )),
      ),
    );
  }
}
