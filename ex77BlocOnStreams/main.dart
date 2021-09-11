import 'package:flutter/material.dart';

import 'color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Streams'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              height: 100,
              width: 100,
              color: snapshot.data as Color,
              duration: Duration(milliseconds: 500),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              }),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_green);
              }),
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
