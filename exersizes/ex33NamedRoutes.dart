import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: FirstHome(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => FirstHome());
          case '/second':
            User user = settings.arguments as User;
            return MaterialPageRoute(builder: (context) => SecondHome(user));
          default:
        }
      },
    ),
  );
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Home'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User('Ilya', 21);
            Navigator.pushNamed(context, '/second', arguments: user);
          },
          child: Text('Second Home'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          User user = User('Konstantin', 34);
          Navigator.pushNamed(context, '/second', arguments: user);
        },
        child: Text('Move to Page 2'),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  SecondHome(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name} - ${this.user.age}'),
        // title: Text('test'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
