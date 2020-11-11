import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class ElevatedInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget trailing;
  final void Function(String value) onSubmit;
  final void Function(String value) onChanged;
  final String labelText;
  final String hint;
  final bool obscureText;
  final bool inputIncorrect;

  const ElevatedInputField({
    Key key,
    this.controller,
    this.focusNode,
    this.onSubmit,
    this.labelText,
    this.obscureText,
    this.inputIncorrect = false,
    this.onChanged,
    this.trailing,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = inputIncorrect
        ? OutlineInputBorder(
            borderSide: BorderSide(color: Style.errorColor),
          )
        : null;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Card(
            elevation: 0,
            color: Style.secondarySurface,
          ),
        ),
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: Style.body,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: trailing,
            labelText: labelText,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            labelStyle: inputIncorrect
                ? Style.body.copyWith(color: Style.errorColor)
                : null,
          ),
          textInputAction: TextInputAction.none,
          obscureText: obscureText ?? false,
          onSubmitted: onSubmit,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}

class ElevatedMultilineInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget trailing;
  final void Function(String value) onSubmit;
  final void Function(String value) onChanged;
  final String labelText;
  final String hint;
  final bool obscureText;
  final bool inputIncorrect;
  final int minLines;
  final int maxLines;

  const ElevatedMultilineInputField({
    Key key,
    this.controller,
    this.focusNode,
    this.onSubmit,
    this.labelText,
    this.obscureText,
    this.inputIncorrect = false,
    this.onChanged,
    this.trailing,
    this.hint,
    this.minLines = 1,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = inputIncorrect
        ? OutlineInputBorder(
            borderSide: BorderSide(color: Style.errorColor),
          )
        : null;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Card(
            elevation: 0,
            color: Style.secondarySurface,
          ),
        ),
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: Style.body,
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: trailing,
            labelText: labelText,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            labelStyle: inputIncorrect
                ? Style.body.copyWith(color: Style.errorColor)
                : null,
          ),
          textInputAction: TextInputAction.none,
          obscureText: obscureText ?? false,
          onSubmitted: onSubmit,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}
