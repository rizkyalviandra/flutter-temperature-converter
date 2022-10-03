import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key, required double result, required String label})
      : _result = result,
        _label = label,
        super(key: key);

  final double _result;
  final String _label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "On $_label",
          style: const TextStyle(fontSize: 20),
        ),
        Text(
          "$_result",
          style: const TextStyle(fontSize: 30),
        )
      ],
    );
  }
}
