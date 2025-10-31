import 'package:flutter/material.dart';

class CustomFieldMultiline extends StatelessWidget {
  final String? helperText;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final TextEditingController controller;

  const CustomFieldMultiline({
    super.key,
    this.helperText,
    required this.controller,
    this.maxLines = 3,
    this.minLines = 1,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      maxLines: null,
      minLines: null,
      expands: true,
      decoration: InputDecoration(labelText: helperText),
    );
  }
}
