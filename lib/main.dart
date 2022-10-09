import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temperature_converter/core/models/convert_model.dart';
import 'package:temperature_converter/ui/screens/converter_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Convert(20, 20, 20, 20),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ConverterScreen(),
    );
  }
}
