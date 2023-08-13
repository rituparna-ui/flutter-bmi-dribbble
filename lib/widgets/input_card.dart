import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final void Function()? onTap;

  const InputCard(
      {super.key, required this.color, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: child,
        ),
      ),
    );
  }
}
