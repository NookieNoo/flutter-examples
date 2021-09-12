import 'package:flutter/material.dart';
// import 'package:flutter_application_1/bloc/user_bloc.dart';
// import 'package:flutter_application_1/bloc/user_event.dart';
import 'package:flutter_application_1/cubit/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  // const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = context.read<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUsers();
          },
        ),
        SizedBox(width: 8),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
          },
        ),
      ],
    );
  }
}
