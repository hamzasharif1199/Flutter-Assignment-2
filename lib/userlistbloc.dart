import 'package:bloc_test_task/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_service.dart';

class UserListBloc extends Cubit<List<UserModel>> {
  final FirebaseService _firebaseService;

  UserListBloc(this._firebaseService) : super([]);

  Future<void> fetchUsers() async {
    try {
      final users = await _firebaseService
          .getUsers(); // Implement this method to fetch users from Firebase
      emit(users);
    } catch (e) {
      // Handle error
    }
  }

  Future<bool> deleteData(UserModel data) async {
    try {
      await _firebaseService.deleteData(
          data); // Implement this method to delete data from Firebase
      final updatedData = state..remove(data.id);
      emit(updatedData);
      return true;
    } catch (e) {
      // Handle error
      return false;
    }
  }
}
