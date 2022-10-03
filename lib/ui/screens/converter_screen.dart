import 'package:flutter/material.dart';
import 'package:temperature_converter/ui/widget/convert_button_widget.dart';
import 'package:temperature_converter/ui/widget/result_widget.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final _inputCelciusController = TextEditingController();
  double _inputCelcius = 0;
  double _fahrenheit = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _rankine = 0;

  convertTemperature() {
    setState(() {
      if (_inputCelciusController.text.isNotEmpty) {
        _inputCelcius = double.parse(_inputCelciusController.text);
        _fahrenheit = (9 / 5) * _inputCelcius + 32;
        _kelvin = _inputCelcius + 273.15;
        _reamur = (4 / 5) * _inputCelcius;
        _rankine = (_inputCelcius + 273.15) * (9 / 5);
      }
    });
  }

  fixedDecimal(double value) {
    return double.parse(value.toStringAsPrecision(3));
  }

  @override
  void dispose() {
    _inputCelciusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          controller: _inputCelciusController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ResultWidget(
                result: fixedDecimal(_fahrenheit), label: "Fahrenheit"),
            ResultWidget(result: fixedDecimal(_kelvin), label: "Kelvin")
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ResultWidget(result: fixedDecimal(_reamur), label: "Reamur"),
            ResultWidget(result: fixedDecimal(_rankine), label: "Rankine")
          ],
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: ConvertButtonWidget(convert: convertTemperature))
      ],
    );
  }
}
