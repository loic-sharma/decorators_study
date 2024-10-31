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

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Text('Click me')
      .padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
      )
      .animatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: _isHovering ? Colors.orange : Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(),
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
      .mouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => _isHovering = true),
        onExit: (event) => setState(() => _isHovering = false),
      )
      .center();
  }
}
