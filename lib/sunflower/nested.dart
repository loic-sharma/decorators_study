// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

const int maxSeeds = 250;

void main() {
  runApp(const Sunflower());
}

class Sunflower extends StatefulWidget {
  const Sunflower({super.key});

  @override
  State<StatefulWidget> createState() => _SunflowerState();
}

class _SunflowerState extends State<Sunflower> {
  int seeds = maxSeeds ~/ 2;

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
          title: const Text('Sunflower'),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: SunflowerWidget(seeds),
              ),
              Text('Showing ${seeds.round()} seeds'),
              SizedBox(
                width: 300,
                child: Slider(
                  min: 1,
                  max: maxSeeds.toDouble(),
                  value: seeds.toDouble(),
                  onChanged: (val) {
                    setState(() => seeds = val.round());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SunflowerWidget extends StatelessWidget {
  const SunflowerWidget(this.seeds, {super.key});

  static const double tau = math.pi * 2;
  static const double scaleFactor = 1 / 40;
  static final double phi = (math.sqrt(5) + 1) / 2;
  static final math.Random rng = math.Random();

  final int seeds;

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    for (var i = 0; i < seeds; i++) {
      final theta = i * tau / phi;
      final r = math.sqrt(i) * scaleFactor;

      seedWidgets.add(AnimatedAlign(
        key: ValueKey(i),
        duration: Duration(milliseconds: rng.nextInt(500) + 250),
        curve: Curves.easeInOut,
        alignment: Alignment(r * math.cos(theta), -1 * r * math.sin(theta)),
        child: const Seed(lit: true),
      ));
    }

    for (var j = seeds; j < maxSeeds; j++) {
      final x = math.cos(tau * j / (maxSeeds - 1)) * 0.9;
      final y = math.sin(tau * j / (maxSeeds - 1)) * 0.9;

      seedWidgets.add(AnimatedAlign(
        key: ValueKey(j),
        duration: Duration(milliseconds: rng.nextInt(500) + 250),
        curve: Curves.easeInOut,
        alignment: Alignment(x, y),
        child: const Seed(lit: false),
      ));
    }

    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox.square(
        dimension: 600.0,
        child: Stack(children: seedWidgets),
      ),
    );
  }
}

class Seed extends StatelessWidget {
  const Seed({super.key, required this.lit});

  final bool lit;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lit ? Colors.orange : Colors.grey.shade700,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: const SizedBox.square(dimension: 5.0),
    );
  }
}
