import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;

  CustomInput({
    super.key,
    required this.controller,
    this.validator,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d*\.?\d*'),
        ),
      ], // Enforce numbers only
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16, // Fixed font size for Windows consistency
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      cursorColor: Colors.white,
    );
  }
}
