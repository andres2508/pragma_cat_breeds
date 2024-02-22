import 'package:cat_breeds/styles/text.styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Labeled extends StatelessWidget {
  final String label;
  final bool isHorizontal;
  final Widget child;

  const Labeled(
      {required this.label,
      required this.child,
      this.isHorizontal = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: isHorizontal ? _buildHorizontal() : _buildVertical(),
    );
  }

  Widget _buildHorizontal() {
    return Row(
      children: [
        Text(
          "${label}:",
          style: const TextStyle(
              fontSize: TextStyles.subtitle1Size, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: child)
      ],
    );
  }

  Widget _buildVertical() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${label}:",
          style: const TextStyle(
              fontSize: TextStyles.subtitle1Size, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: child)
      ],
    );
  }
}
