import 'package:flutter/material.dart';

class Convert with ChangeNotifier {
  double? inputCelcius;
  double fahrenheit;
  double kelvin;
  double reamur;
  double rankine;

  void convertTemperature(inputCelcius) {
    fahrenheit = (9 / 5) * inputCelcius + 32;
    kelvin = inputCelcius + 273.15;
    reamur = (4 / 5) * inputCelcius;
    rankine = (inputCelcius + 273.15) * (9 / 5);
    notifyListeners();
  }

  Convert(this.fahrenheit, this.kelvin, this.rankine, this.reamur);
}
