// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.obscureText,
    required this.labelText,
    this.validator,
  }) : super(key: key);
  final String hintText;
  final void Function(String) onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        // errorText: errorText,
      ),
    );
  }
}
