import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const MyButton(),
      ),
    ),
  );
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Click me')
      .padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
      )
      .decoratedBox(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 5,
            ),
          ],
        ),
      )
      .gestureDetector(onTap: () => debugPrint('Hello world'))
      .mouseRegion(cursor: SystemMouseCursors.click)
      .center();
  }
}
