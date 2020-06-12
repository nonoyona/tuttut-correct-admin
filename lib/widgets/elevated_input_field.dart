import 'package:correct/utils/style.dart';
import 'package:flutter/material.dart';

class ElevatedInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget trailing;
  final void Function(String value) onSumbit;
  final void Function(String value) onChanged;
  final String labelText;
  final String hint;
  final bool obscureText;
  final bool inputIncorrect;

  const ElevatedInputField({
    Key key,
    this.controller,
    this.focusNode,
    this.onSumbit,
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
          onSubmitted: onSumbit,
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
  final void Function(String value) onSumbit;
  final void Function(String value) onChanged;
  final String labelText;
  final String hint;
  final bool obscureText;
  final bool inputIncorrect;

  const ElevatedMultilineInputField({
    Key key,
    this.controller,
    this.focusNode,
    this.onSumbit,
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
          minLines: 1,
          maxLines: 5,
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
          onSubmitted: onSumbit,
          onChanged: this.onChanged,
        ),
      ],
    );
  }
}

