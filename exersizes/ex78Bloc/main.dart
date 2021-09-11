import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ColorBloc(Colors.red),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc with flutter_bloc'),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(builder: (context, currentColor) {
          return AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          )
        ],
      ),
    );
  }
}
