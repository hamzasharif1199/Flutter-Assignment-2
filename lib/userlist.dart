import 'package:bloc_test_task/user_model.dart';
import 'package:bloc_test_task/userlistbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userListBloc = BlocProvider.of<UserListBloc>(context);

    return BlocBuilder<UserListBloc, List<UserModel>>(
      builder: (context, userList) {
        return userList.length == 0
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage('assets/image.png')),
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Current employees',
                            style: TextStyle(color: Color(0xff1DA1F2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return Dismissible(
                          key: Key(user.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) async {
                            final isDeleted =
                                await userListBloc.deleteData(user);
                            if (isDeleted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Data deleted'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Failed to delete data'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 15.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(user.role),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      children: [
                                        Text(user.startDate),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text('-'),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Text(user.endDate),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Swipe left to delete the Data..',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
