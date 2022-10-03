import 'package:flutter/material.dart';

class ConvertButtonWidget extends StatelessWidget {
  final VoidCallback convert;
  const ConvertButtonWidget({super.key, required this.convert});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed: convert,
          child: const Text(
            "Convert",
            style: TextStyle(fontSize: 20),
          ),
        ))
      ],
    );
  }
}
