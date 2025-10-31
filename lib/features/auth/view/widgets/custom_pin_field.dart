import 'package:flutter/material.dart';
import 'package:passman/features/home/view/widgets/custom_field.dart';

class CustomPinField extends StatefulWidget {
  final int? pinLength;
  final Function(List<String> fieldText) onChange;
  const CustomPinField({super.key, this.pinLength = 6, required this.onChange});

  @override
  State<CustomPinField> createState() => _CustomPinFieldState();
}

class _CustomPinFieldState extends State<CustomPinField> {
  late List<Map<FocusNode, TextEditingController>> _focusNode;
  late List<CustomField> _pinField;

  @override
  void initState() {
    _focusNode = List.generate(
      widget.pinLength!,
      (_) => {FocusNode(): TextEditingController()},
    );
    _pinField = List.generate(
      widget.pinLength!,
      (index) => CustomField(
        focusNode: _focusNode[index].keys.first,
        controller: _focusNode[index].values.first,
        maxLength: 1,
        textStyle: TextStyle(fontSize: 18.0),
        obscure: true,
        counter: SizedBox.shrink(),
        textInputAction: _focusNode.length - 1 == index
            ? TextInputAction.next
            : TextInputAction.done,
        onChange: (text) {
          // TODO: bug-> if length empty if at staring backspacing is not working
          if (text.length == 1) {
            _focusNode[index].keys.first.nextFocus();
          } else if (text.isEmpty) {
            _focusNode[index].keys.first.previousFocus();
          }

          List<String> fieldText = [];
          for (var node in _focusNode) {
            fieldText.add(node.values.first.text);
          }
          widget.onChange(fieldText);
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNode) {
      node.keys.first.dispose();
      node.values.first.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _pinField
          .map(
            (field) => Expanded(
              child: Padding(padding: const EdgeInsets.all(2.0), child: field),
            ),
          )
          .toList(),
    );
  }
}
