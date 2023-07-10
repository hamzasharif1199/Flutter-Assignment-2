import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormBloc extends Cubit<FormState> {
  FormBloc() : super(FormState());

  void updateDropdownValue(String value) {
    emit(state.copyWith(dropdownValue: value));
  }

  void updateTextField1(String value) {
    emit(state.copyWith(textField1: value));
  }

  void updateDate1(String value) {
    emit(state.copyWith(date1: value));
  }

  void updateDate2(String value) {
    emit(state.copyWith(date2: value));
  }

  Future<bool> saveForm() async {
    final completer = Completer<bool>();
    // Perform save logic
    print(state.date1);
    print(state.date2);
    print(state.textField1);
    print(state.dropdownValue);

    try {
      final docRef = await FirebaseFirestore.instance.collection('users').add({
        'name': state.textField1,
        'role': state.dropdownValue,
        'startDate': state.date1,
        'endDate': state.date2,
      });
      final userId = docRef.id;

      await docRef.update({'id': userId});

      Fluttertoast.showToast(
        msg: "Employee Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      completer.complete(
          true); // Set the completer as completed with a value of true
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Something went wrong!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      completer.complete(
          false); // Set the completer as completed with a value of false
    }

    return completer.future;
  }
}
//   bool saveForm() {
//     bool saved = false;
//     // Perform save logic
//     print(state.date1);
//     print(state.date2);
//     print(state.textField1);
//     print(state.dropdownValue);

//     FirebaseFirestore.instance.collection('users').add({
//       'name': state.textField1,
//       'role': state.dropdownValue,
//       'startDate': state.date1,
//       'endDate': state.date2,
//     }).then((value) {
//       Fluttertoast.showToast(
//           msg: "Employee Added",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(value.id)
//           .update({'id': value.id}).then((value) {
//         saved = true;
//       }).catchError((onError) {
//         Fluttertoast.showToast(
//             msg: "Something went wrong!!",
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.red,
//             textColor: Colors.white,
//             fontSize: 16.0);
//       });
//     }).catchError((onError) {
//       Fluttertoast.showToast(
//           msg: "Something went wrong!!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//     });
//     return saved;
//   }
// }

class FormState {
  final String dropdownValue;
  final String textField1;
  final String date1;
  final String date2;
  FormState({
    this.dropdownValue = '',
    this.textField1 = '',
    this.date1 = '',
    this.date2 = '',
  });

  FormState copyWith({
    String? dropdownValue,
    String? textField1,
    String? date1,
    String? date2,
  }) {
    return FormState(
      dropdownValue: dropdownValue ?? this.dropdownValue,
      textField1: textField1 ?? this.textField1,
      date1: date1 ?? this.date1,
      date2: date2 ?? this.date2,
    );
  }
}
