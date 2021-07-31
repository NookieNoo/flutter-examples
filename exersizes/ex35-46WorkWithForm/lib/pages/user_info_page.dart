import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';

class UserInfoPage extends StatelessWidget {
  User? userInfo;
  UserInfoPage({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                userInfo?.name ?? 'Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(userInfo?.story ?? 'Story'),
              leading: Icon(Icons.person, color: Colors.black),
              trailing: Text(userInfo?.country ?? 'Country'),
            ),
            ListTile(
              title: Text(
                userInfo?.phone ?? 'Phone',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.phone, color: Colors.black),
              trailing: Text('Phone'),
            ),
            ListTile(
              title: Text(
                userInfo?.email ?? 'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.mail, color: Colors.black),
              trailing: Text('Email'),
            ),
          ],
        ),
      ),
    );
  }
}
