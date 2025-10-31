import 'package:flutter/material.dart';
import 'package:passman/features/home/view/widgets/styled_field.dart';

class DatepickerField extends StatefulWidget {
  final Function(List<String> expDate) expDate;
  const DatepickerField({super.key, required this.expDate});
  @override
  State<DatepickerField> createState() => _DatepickerFieldState();
}

class _DatepickerFieldState extends State<DatepickerField> {
  final List<FocusNode> _focusNodeList = [FocusNode(), FocusNode()];
  final TextEditingController _monthTextController = TextEditingController();
  final TextEditingController _yearTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> date = ["00", "0000"];
    return Row(
      children: [
        SizedBox(
          width: 24.0,
          child: StyledField(
            keyboardType: TextInputType.number,
            controller: _monthTextController,
            hintText: "00",
            maxLength: 2,
            textInputAction: TextInputAction.next,
            focusNode: _focusNodeList[0],
            onChange: (text) {
              if (text.length == 2) {
                _focusNodeList[1].nextFocus();
              }
              date[0] = text;
              widget.expDate(date);
            },
          ),
        ),

        Text("/"),
        SizedBox(
          width: 60.0,
          child: StyledField(
            controller: _yearTextController,
            textInputAction: TextInputAction.next,
            hintText: "0000",
            maxLength: 4,
            focusNode: _focusNodeList[1],
            onChange: (text) {
              if (text.length == 4) {
                _focusNodeList[1].nextFocus();
              }
              date[1] = text;
              widget.expDate(date);
            },
          ),
        ),
      ],
    );
  }
}
