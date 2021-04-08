import 'dart:math';

import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;

  void _runAnimation() {
    setState(() {
      final random = Random();
      _width = random.nextInt(250).toDouble();
      _height = random.nextInt(250).toDouble();
      _color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
    });

    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Page'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runAnimation,
        tooltip: 'Increment',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
