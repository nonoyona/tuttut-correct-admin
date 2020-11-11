import 'package:correct/widgets/elevated_input_field.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DoubleInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget trailing;
  final void Function(double value) onSubmit;
  final void Function(double value) onChanged;
  final String labelText;
  final String hint;
  final bool obscureText;
  final bool inputIncorrect;

  const DoubleInputField(
      {Key key,
      this.focusNode,
      this.trailing,
      this.onSubmit,
      this.onChanged,
      this.labelText,
      this.hint,
      this.obscureText,
      this.inputIncorrect,
      this.controller})
      : super(key: key);

  @override
  _DoubleInputFieldState createState() => _DoubleInputFieldState();
}

class _DoubleInputFieldState extends State<DoubleInputField> {
  bool inputIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedInputField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      trailing: widget.trailing,
      onSubmit: _onSubmit,
      onChanged: _onChanged,
      hint: widget.hint,
      inputIncorrect: inputIncorrect || (widget.inputIncorrect ?? false),
      labelText: widget.labelText,
      obscureText: widget.obscureText,
    );
  }

  void _onSubmit(String value) {
    var output = double.tryParse(value);
    if (output == null) {
      setState(() {
        inputIncorrect = true;
      });
    } else {
      setState(() {
        inputIncorrect = false;
      });
      widget.onSubmit?.call(output < 0 ? -output : output);
    }
  }

  void _onChanged(String value) {
    var output = double.tryParse(value);
    if (output == null) {
      setState(() {
        inputIncorrect = true;
      });
    } else {
      setState(() {
        inputIncorrect = false;
      });
      widget.onChanged?.call(output < 0 ? -output : output);
    }
  }
}
