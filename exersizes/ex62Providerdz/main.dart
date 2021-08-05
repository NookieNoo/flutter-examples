import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<ColorProvider>(
        child: MyColorPage(),
        create: (context) => ColorProvider(),
      ),
    );
  }
}

class MyColorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorProvider _state = Provider.of<ColorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Consumer<ColorProvider>(builder: (context, value, child) {
          return Text(
            'Test Provider',
            style: TextStyle(color: value.titleColor),
          );
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ChangeNotifierProvider Example',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 50),
            AnimatedContainer(
              duration: Duration(seconds: 1),
              color: _state.blockColor,
              width: 150,
              height: 150,
            ),
            Consumer<ColorProvider>(builder: (context, value, child) {
              return Switch(
                value: value.isSwitchedValue,
                onChanged: value._changeColors,
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              );
            }),
          ],
        ),
      ),
    );
  }
}

// CountProvider (ChangeNotifier)
class ColorProvider extends ChangeNotifier {
  Color _titleColor =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  Color _blockColor =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  bool _isSwitched = false;
  Color get titleColor => _titleColor;
  Color get blockColor => _blockColor;
  bool get isSwitchedValue => _isSwitched;

  void _changeColors(bool isSwitched) {
    _titleColor =
        Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
    _blockColor =
        Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
    _isSwitched = isSwitched;
    notifyListeners();
  }
}
