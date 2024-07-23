import 'package:flutter/material.dart';

class EfficiencyIndicator extends StatelessWidget {
  final double efficiency;

  EfficiencyIndicator({required this.efficiency});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.assessment, color: Colors.green),
        SizedBox(width: 4),
        Text('${(efficiency * 100).toStringAsFixed(1)}%'), // 퍼센트로 표시
      ],
    );
  }
}
