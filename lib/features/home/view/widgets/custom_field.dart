import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String? helperText;
  final TextEditingController controller;
  final bool? obscure;
  final bool? suffixEye;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final int? maxLength;
  final Widget? counter;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final Function(String text)? onChange;
  const CustomField({
    super.key,
    this.helperText,
    required this.controller,
    this.obscure,
    this.suffixEye,
    this.textInputAction,
    this.focusNode,
    this.maxLength,
    this.textStyle,
    this.counter,
    this.onChange,
    this.keyboardType,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    bool isObscure = obscure ?? false;
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: controller,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          obscureText: isObscure,
          focusNode: focusNode,
          maxLength: maxLength,
          style: textStyle,
          decoration: InputDecoration(
            labelText: helperText,
            suffixIcon: suffixEye != null
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = isObscure ? false : true;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                  )
                : null,
            counter: counter,
          ),
          onChanged: (value) {
            if (onChange != null) {
              onChange!(value);
            }
          },
        );
      },
    );
  }
}
