import 'package:flutter/material.dart';

class StyledField extends StatelessWidget {
  final String? hintText;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String text)? onChange;
  final bool? nullable;
  final TextEditingController? controller;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  const StyledField({
    super.key,
    this.hintText,
    this.textInputAction,
    this.maxLength,
    this.focusNode,
    this.onChange,
    this.controller,
    this.nullable = true,
    this.style,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.textCapitalization,
  });

  @override
  Widget build(BuildContext context) {
    // Use a Builder to get the *context* below the main theme
    return Builder(
      builder: (BuildContext innerContext) {
        // Get the current (global) input decoration theme
        final globalTheme = Theme.of(innerContext).inputDecorationTheme;

        // Create a local theme by copying the global one and overriding specific values
        final localTheme = globalTheme.copyWith(
          // Override properties you want to change
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          isDense: true,
          hintStyle: const TextStyle(
            fontSize: 18.0,
            color: Color.fromARGB(255, 135, 169, 196),
          ),
          // Use the global border, but update its radius
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // Use 'as InputBorder?' to correctly handle the type
        );

        return Theme(
          data: Theme.of(
            innerContext,
          ).copyWith(inputDecorationTheme: localTheme),
          child: TextFormField(
            style: style,
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            maxLength: maxLength,
            textInputAction: textInputAction,
            textAlign: textAlign!,
            validator: (value) {
              if (!nullable! && value == null || value!.isEmpty) {
                return;
              }
              return null;
            },
            decoration: InputDecoration(
              // Only set non-theme properties here!
              hintText: hintText,
              counter: SizedBox.shrink(),
            ),
            onChanged: (value) {
              if (onChange != null) {
                onChange!(value);
              }
            },
          ),
        );
      },
    );
  }
}
