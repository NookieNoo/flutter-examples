import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Weather Forecast',
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0,
        ),
        backgroundColor: Colors.redAccent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _textField(),
              ),
              _cityDetails(),
              _tempDetail(),
              _extraDetail(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  '7-DAY WEATHER FORECAST',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w300),
                ),
              ),
              _wetherDay(),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme(subtitle1: TextStyle(color: Colors.white)),
      ),
    );
  }
}

TextField _textField() {
  return TextField(
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      hintText: 'Enter City Name',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
}

Column _cityDetails() {
  return Column(
    children: [
      Text(
        'Murmansk Oblast. RU',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
      SizedBox(
        height: 8,
      ),
      Text(
        'MFriday, May 20, 2020',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.center,
  );
}

Container _tempDetail() {
  return Container(
    margin: EdgeInsets.all(20),
    child: Container(
      width: 210,
      child: ListTile(
        leading: Icon(Icons.wb_sunny, size: 70, color: Colors.white),
        title: Text(
          '14 ℉',
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.w100),
        ),
        subtitle: Text(
          'LIGHT SNOW',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ),
    ),
  );
}

Container _extraDetail() {
  return Container(
    margin: EdgeInsets.all(10),
    child: Container(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(Icons.ac_unit, color: Colors.white),
                Text(
                  '5',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text('km/hr', style: TextStyle(color: Colors.white))
              ],
            ),
            Column(
              children: [
                Icon(Icons.ac_unit, color: Colors.white),
                Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text('%', style: TextStyle(color: Colors.white))
              ],
            ),
            Column(
              children: [
                Icon(Icons.ac_unit, color: Colors.white),
                Text(
                  '20',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text('%', style: TextStyle(color: Colors.white))
              ],
            )
          ],
        )),
  );
}

Container _wetherDay() {
  return Container(
    margin: EdgeInsets.all(5),
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _day('Friday', 6),
        _day('Saturday', 5),
        _day('Sunday', 4),
        _day('Monday', 7),
        _day('Tuesday', 8),
        _day('Wednesday', 10),
        _day('Friday', 9),
      ],
    ),
  );
}

Container _day(String text, int temp) {
  return Container(
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(10),
    color: Colors.white30,
    width: 120,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w300, color: Colors.white, fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$temp ℉',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 20),
            ),
            Icon(Icons.wb_sunny, size: 30, color: Colors.white)
          ],
        )
      ],
    ),
  );
}
