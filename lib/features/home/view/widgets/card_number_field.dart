import 'package:flutter/material.dart';
import 'package:passman/features/home/view/widgets/styled_field.dart';

class CardNumberField extends StatefulWidget {
  final int? inputLength;
  final int inputFieldLength;
  final bool? nullable;
  final Function(List<String> cardNumber) cardNumber;
  const CardNumberField({
    super.key,
    this.inputLength = 4,
    required this.inputFieldLength,
    this.nullable,
    required this.cardNumber,
  });

  @override
  State<CardNumberField> createState() => _CardNumberFieldState();
}

class _CardNumberFieldState extends State<CardNumberField> {
  late List<Map<FocusNode, TextEditingController>> _focusNodeList;
  late List<StyledField> cardNumberFields;
  List<String> cardNumber = ["", "", "", ""];
  @override
  void initState() {
    _focusNodeList = List.generate(
      widget.inputFieldLength,
      (_) => {FocusNode(): TextEditingController()},
    );
    cardNumberFields = List.generate(
      widget.inputFieldLength,
      (index) => StyledField(
        maxLength: widget.inputLength,
        keyboardType: TextInputType.number,
        hintText: "0000",
        nullable: false,
        controller: _focusNodeList[index].values.first,
        textInputAction: TextInputAction.next,
        focusNode: _focusNodeList[index].keys.first,
        onChange: (text) {
          if (text.isEmpty) {
            _focusNodeList[index].keys.first.previousFocus();
          }
          if (text.length == 4) {
            _focusNodeList[index].keys.first.nextFocus();
          }

          cardNumber[index] = _focusNodeList[index].values.first.text;
          // Send callback
          widget.cardNumber(cardNumber);
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var node in _focusNodeList) {
      node.keys.first.dispose();
      node.values.first.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: cardNumberFields
          .map(
            (numField) => SizedBox(
              width: numField.runtimeType != Text ? 60.0 : 14.0,
              child: numField,
            ),
          )
          .toList(),
    );
  }
}
