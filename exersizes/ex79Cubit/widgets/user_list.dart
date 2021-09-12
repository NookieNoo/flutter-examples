import 'package:flutter/material.dart';
// import 'package:flutter_application_1/bloc/user_bloc.dart';
import 'package:flutter_application_1/cubit/user_state.dart';
import 'package:flutter_application_1/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return Center(
          child: Text(
            'No data received. Press button "Load"',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      if (state is UserLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                'ID: ${state.loadedUser[index].id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: <Widget>[
                  Text(
                    '${state.loadedUser[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Email: ${state.loadedUser[index].email}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        'Phone: ${state.loadedUser[index].phone}',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if (state is UserErrorState) {
        return Center(
          child: Text(
            'Error fetching users',
            style: TextStyle(fontSize: 20),
          ),
        );
      }
      return Text('unhandled error');
    });
  }
}
