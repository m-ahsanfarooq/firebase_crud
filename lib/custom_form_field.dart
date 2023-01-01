import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final bool autoFocus;
  final bool enabled;
  final List<TextInputFormatter>? inputFormat;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final int? maxLine;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool enableInteractiveSelection;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final Color? cursorColor;
  final TextInputAction inputAction;
  final String lable;
  final bool isCapatilize;
  final bool isLableEnabled;

  const CustomFormField({
    Key? key,
    this.controller,
    this.enabled = true,
    required this.hintText,
    this.prefixIcon,
    this.inputFormat,
    this.autoFocus = false,
    this.keyboardType = TextInputType.name,
    this.maxLength,
    this.maxLine = 1,
    this.focusNode,
    this.enableInteractiveSelection = true,
    this.onSaved,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    this.initialValue,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.cursorColor,
    required this.inputAction,
    required this.lable,
    this.isCapatilize = false,
    this.isLableEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      autofocus: autoFocus,
      focusNode: focusNode,
      onSaved: onSaved,
      obscureText: obscureText,
      validator: validator,
      initialValue: initialValue,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      cursorColor: cursorColor,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLine,
      enableInteractiveSelection: enableInteractiveSelection,
      inputFormatters: inputFormat,
      keyboardType: keyboardType,
      textCapitalization:
          isCapatilize ? TextCapitalization.words : TextCapitalization.none,
      style: const TextStyle(color: Colors.amberAccent),
      decoration: InputDecoration(
        labelText: isLableEnabled ? lable : null,
        labelStyle: const TextStyle(color: Colors.orangeAccent),
        prefixIcon: prefixIcon,
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(
            color: Colors.redAccent, fontWeight: FontWeight.bold),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.amberAccent, width: 2)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.redAccent, width: 4),
        ),
      ),
    );
  }
}
