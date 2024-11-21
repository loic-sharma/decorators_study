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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.home),
        SizedBox(width: 8),
        Text('Click me')
      ],
    )
    .padding(padding: EdgeInsets.all(8))
    .animatedContainer(
      duration: const Duration(milliseconds: 500),
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
    .gestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Button clicked!')),
        );
      },
    )
    .center();
  }
}
