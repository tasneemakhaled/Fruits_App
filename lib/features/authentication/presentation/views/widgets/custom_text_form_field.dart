import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.keyboardType,
  });
  final String hintText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
        ),
      ),
    );
  }
}
