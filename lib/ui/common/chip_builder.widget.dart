import 'package:cat_breeds/styles/text.styles.dart';
import 'package:flutter/material.dart';

class PragmaChipBuilder extends StatelessWidget {
  final List<String> chips;

  const PragmaChipBuilder({required this.chips, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: chips.map((e) => _buildChip(e)).toList(growable: false),
    );
  }

  Widget _buildChip(String chip) {
    return Chip(
        label: Text(
      chip,
      style: TextStyles.minimalStyle,
    ));
  }
}
