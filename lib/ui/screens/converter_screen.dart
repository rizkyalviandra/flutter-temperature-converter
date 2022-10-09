import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_converter/core/constants/fixed_decimal.dart';
import 'package:temperature_converter/core/models/convert_model.dart';
import 'package:temperature_converter/ui/widgets/convert_button_widget.dart';
import 'package:temperature_converter/ui/widgets/result_widget.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Convert convertProvider = Provider.of<Convert>(context);
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Temperature Converter")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            controller: inputController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ResultWidget(
                  result: fixedDecimal(convertProvider.fahrenheit),
                  label: "Fahrenheit"),
              ResultWidget(
                  result: fixedDecimal(convertProvider.kelvin), label: "Kelvin")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ResultWidget(
                  result: fixedDecimal(convertProvider.reamur),
                  label: "Reamur"),
              ResultWidget(
                  result: fixedDecimal(convertProvider.rankine),
                  label: "Rankine")
            ],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ConvertButtonWidget(convert: () {
                Provider.of<Convert>(context, listen: false)
                    .convertTemperature(double.parse(inputController.text));
              }))
        ],
      ),
    );
  }
}
