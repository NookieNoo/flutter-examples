import 'package:flutter/material.dart';
import 'package:flutter_application_1/offices.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<OfficesList>? officesList;

  @override
  void initState() {
    // init state как useEffect[]
    super.initState();
    officesList = getOfficesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
        centerTitle: true,
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data?.offices?[index].name}'),
                    subtitle: Text('${snapshot.data?.offices?[index].address}'),
                    leading: Image.network(
                        '${snapshot.data?.offices?[index].image}'),
                    isThreeLine: true,
                  ),
                );
              },
              itemCount: snapshot.data?.offices?.length,
            );
          } else if (snapshot.hasError) {
            return Text('Error');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Future<http.Response> getData() async {
  var url = Uri.parse('https://about.google/static/data/locations.json');
  return await http.get(url);
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
