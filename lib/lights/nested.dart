// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

const int maxLights = 250;

void main() {
  runApp(const Lights());
}

class Lights extends StatefulWidget {
  const Lights({super.key});

  @override
  State<StatefulWidget> createState() => _LightsState();
}

class _LightsState extends State<Lights> {
  int lights = maxLights ~/ 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lights'),
        ),
        body: SizedBox(
          width: 600,
          child: Column(
            spacing: 20,
            children: [
              Expanded(
                child: Center(
                  child: LightWidget(lights),
                ),
              ),
        
              Text('$lights ${lights == 1 ? 'light' : 'lights'} on'),
        
              Slider(
                min: 1,
                max: maxLights.toDouble(),
                value: lights.toDouble(),
                onChanged: (double value) {
                  setState(() => lights = value.round());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LightWidget extends StatelessWidget {
  const LightWidget(this.lightsOn, {super.key});

  static final math.Random random = math.Random();

  final int lightsOn;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < maxLights; i++)
          Light(lit: i < lightsOn),
      ],
    );
  }
}

class Light extends StatelessWidget {
  const Light({super.key, required this.lit});

  final bool lit;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? Colors.orange : Colors.grey.shade700,
        shape: BoxShape.circle,
      ),
      child: const SizedBox.square(dimension: 25.0),
    );
  }
}
