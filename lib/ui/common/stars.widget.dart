import 'package:flutter/material.dart';

class StarsRanking extends StatelessWidget {
  final int ranking;

  const StarsRanking({required this.ranking, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _buildStars(),
    );
  }

  List<Widget> _buildStars() {
    final List<Widget> startsRanking = [];
    for (var i = 0; i < ranking; i++) {
      startsRanking.add(const Icon(
        Icons.star,
        color: Colors.orange,
      ));
    }
    return startsRanking;
  }
}
