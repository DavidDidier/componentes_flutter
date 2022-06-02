import 'dart:math';

import 'package:flutter/material.dart';

class ContainerAnimatedPage extends StatefulWidget {
  @override
  createState() => _ContainerAnimatedPageState();
}

class _ContainerAnimatedPageState extends State<ContainerAnimatedPage> {
  double _width = 50.0;
  double _heidth = 50.0;
  Color _color = Colors.yellowAccent;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(7.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container animado'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceInOut,
          width: _width,
          height: _heidth,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow_sharp),
        onPressed: _cambioForma,
      ),
    );
  }

  /// It changes the shape of the container.
  void _cambioForma() {
    final random = Random();
    setState(() {
      _width = random.nextInt(280).toDouble();
      _heidth = random.nextInt(280).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(280), random.nextInt(280), 1);

      _borderRadius = BorderRadius.circular(random.nextInt(90).toDouble());
    });
  }
}
