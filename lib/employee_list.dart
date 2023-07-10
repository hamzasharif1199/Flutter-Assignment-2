import 'package:bloc_test_task/userlist.dart';
import 'package:bloc_test_task/userlistbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_service.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final FirebaseService _firebaseService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff1DA1F2),
        title: const Text('Employee List'),
      ),
      body: BlocProvider(
          create: (context) => UserListBloc(_firebaseService)..fetchUsers(),
          child: UserListWidget()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1DA1F2),
        onPressed: () {
          Navigator.pushNamed(context, '/datascreen');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
