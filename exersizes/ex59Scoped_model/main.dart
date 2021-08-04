import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Inherited Demo',
        home: MyHomePage(),
        theme: ThemeData(primarySwatch: Colors.blue));
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;
  MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ScopedModel<MyModelState>(
            model: MyModelState(),
            child: AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: <Widget>[
          Text('(Root Widget)', style: Theme.of(context).textTheme.headline4),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Counter(),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      rebuildOnChange: true,
      builder: (context, child, model) => Card(
        margin: EdgeInsets.all(4.0).copyWith(bottom: 32.0),
        color: Colors.yellowAccent,
        child: Column(
          children: <Widget>[
            Text('(Child Widget)'),
            Text('${model.counterValue}',
                style: Theme.of(context).textTheme.headline4),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: () => model._decrementCounter(),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: () => model._incrementCounter(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyModelState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
