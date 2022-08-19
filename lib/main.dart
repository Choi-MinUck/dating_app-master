import 'package:flutter/material.dart';
import 'package:dating_app/widgets/cards_stack_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: const [
            CardsStackWidget(),
          ],
        ),
      ),
    );
  }
}

enum Swipe { left, right, top, bottom, none }
