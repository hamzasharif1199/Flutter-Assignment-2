import 'package:flutter/material.dart';
import 'form_widget.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1DA1F2),
        title: Text('Add Employee Detail'),
      ),
      body: FormWidget(),
    );
  }
}
