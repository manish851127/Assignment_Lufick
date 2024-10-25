import 'package:flutter/material.dart';

class PrimaryTextfield extends StatelessWidget {
  final String labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final Function(String)? onChanged;

  const PrimaryTextfield(
      {super.key,
      this.textEditingController,
      required this.labelText,
      this.validator,
      this.obscureText = false,
      this.initialValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText!,
        validator: validator,
        onChanged: onChanged,
        controller: textEditingController,
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )));
  }
}
