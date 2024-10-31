import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Button app'),
      ),

      body: Text('Click me')
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
        .gestureDetector(onTap: () => print('Hello world'))
        .mouseRegion(cursor: SystemMouseCursors.click)
        .center(),
    );
  }
}
