import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(ColorChanger());

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color _randomizedColor;
  var _randomizer = new Random();
  var _minPowerOfColor = 0;
  var _maxPowerOfColor = 253;

  @override
  void initState() {
    _randomizeColor();
    super.initState();
  }

  void _randomizeColor() {
    setState(() {
      _randomizedColor = Color.fromRGBO(
        _minPowerOfColor +
            _randomizer.nextInt(_maxPowerOfColor - _minPowerOfColor),
        _minPowerOfColor +
            _randomizer.nextInt(_maxPowerOfColor - _minPowerOfColor),
        _minPowerOfColor +
            _randomizer.nextInt(_maxPowerOfColor - _minPowerOfColor),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: GestureDetector(
          onTap: _randomizeColor,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            color: _randomizedColor,
            child: Center(
              child: Text(
                'Hey there!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
