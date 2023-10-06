import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Color Change',
      home: ButtonColorChangeScreen(),
    );
  }
}

class ButtonColorChangeScreen extends StatefulWidget {
  const ButtonColorChangeScreen({super.key});

  @override
  _ButtonColorChangeScreenState createState() => _ButtonColorChangeScreenState();
}

class _ButtonColorChangeScreenState extends State<ButtonColorChangeScreen> {
  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
  List<String> buttonSizes = ['S', 'M', 'L', 'XL','XXL', 'XXXL'];
  String? selectedSize;

  void handleButtonTap(String size) {
    setState(() {
      selectedSize = size;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4, // Change the number of columns as needed
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: buttonSizes.map((size) {
            return ElevatedButton(
              onPressed: () {
                MySnackBar("You have pressed size: $size", context);
                return handleButtonTap(size);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: size == selectedSize ? Colors.orange : Colors.white70, // Change color based on selection

              ),
              child: Text(size),
            );
          }).toList(),
        ),
      ),
    );
  }
}