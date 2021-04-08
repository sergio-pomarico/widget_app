import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({Key key, this.title}) : super(key: key);

  void _navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _navigateTo(
                context,
                '/animation',
              ),
              child: Text('Ir a Animation Page'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(
                context,
                '/input',
              ),
              child: Text('Ir a Input Page'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(
                context,
                '/list',
              ),
              child: Text('Ir a List page'),
            ),
          ],
        ),
      ),
    );
  }
}
