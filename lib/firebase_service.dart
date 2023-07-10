import 'package:bloc_test_task/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserModel>> getUsers() async {
    final snapshot = await _firestore.collection('users').get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return UserModel(
          id: doc['id'],
          name: doc['name'],
          role: data['role'],
          startDate: data['startDate'],
          endDate: data['endDate']);
    }).toList();
  }

  Future<void> deleteData(UserModel data) async {
    await _firestore.collection('users').doc(data.id).delete();
  }
}
