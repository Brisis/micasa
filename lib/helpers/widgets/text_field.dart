import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isReadOnly;
  final bool isObsecure;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.isReadOnly = false,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: isReadOnly,
      controller: controller,
      decoration: InputDecoration(
        //fillColor: bgColor,
        // filled: true,
        labelText: hintText,
        hintText: hintText,
      ),
      obscureText: isObsecure,
      onChanged: (value) => value = controller.text,
    );
  }
}
