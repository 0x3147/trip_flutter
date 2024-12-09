import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hint;
  final ValueChanged<String>? onChange;
  final bool obscureText;
  final TextInputType? keyboardType;

  const InputWidget(
      {super.key,
      required this.hint,
      this.onChange,
      this.obscureText = false,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _input(),
        const Divider(color: Colors.white, height: 1, thickness: 0.5)
      ],
    );
  }

  _input() {
    return TextField(
      onChanged: onChange,
      obscureText: obscureText,
      keyboardType: keyboardType,
      autofocus: !obscureText,
      cursorColor: Colors.white,
      style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );
  }
}
