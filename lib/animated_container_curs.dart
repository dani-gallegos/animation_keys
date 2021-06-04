import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerCurs extends StatefulWidget {
  const AnimatedContainerCurs({Key? key}) : super(key: key);

  @override
  _AnimatedContainerCursState createState() => _AnimatedContainerCursState();
}

class _AnimatedContainerCursState extends State<AnimatedContainerCurs> {
  double _width = 0;
  double _height = 0;
  Color _color = Colors.white;
  BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  @override
  void initState() {
    super.initState();
    _width = 50;
    _height = 50;
    _color = Colors.green;
    _borderRadius = BorderRadius.circular(8);
  }

  void next() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();

      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        next();
      },
      child: AnimatedContainer(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}
