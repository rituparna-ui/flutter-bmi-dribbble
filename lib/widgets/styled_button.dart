import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const StyledButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: const ButtonStyle().copyWith(
        shape: const MaterialStatePropertyAll(
          CircleBorder(),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          kButtonColor,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.all(6),
        ),
        elevation: const MaterialStatePropertyAll(1.5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
