import 'package:firbase_crud_example/ui/add_item_form.dart';
import 'package:firbase_crud_example/ui/appbar.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF2C384A),
        appBar: AppBar(
          elevation: 0,backgroundColor: const Color(0xFF2C384A),
          title: const CustomAppBar(sectionName: 'CRUD',),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
            child: AddItemForm(
                titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode
            ),
          ),
        ),
      ),
    );
  }
}
