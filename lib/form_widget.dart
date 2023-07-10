import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'form_bloc.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  late FormBloc _bloc;

  final TextEditingController _textField1Controller = TextEditingController();
  final TextEditingController date1Controller = TextEditingController();
  final TextEditingController date2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = FormBloc();
    // date1Controller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // date2Controller.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void dispose() {
    _bloc.close();
    _textField1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocBuilder<FormBloc, dynamic>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 30.0, bottom: 10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            controller: _textField1Controller,
                            onChanged: (value) {
                              _bloc.updateTextField1(value);
                            },
                            decoration: const InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Color(0xff1DA1F2)),
                              hintText: 'Employee Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonFormField<String>(
                            // value: state.dropdownValue,
                            onChanged: (value) {
                              _bloc.updateDropdownValue(value ?? '');
                            },
                            items: <String>[
                              'Product Designer',
                              'Flutter Developer',
                              'QA Tester',
                              'Product Owner',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.work,
                                color: Color(0xff1DA1F2),
                              ),
                              border: InputBorder.none,
                              hintText: 'Select role',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                controller:
                                    date1Controller, //editing controller of this TextField
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff1DA1F2),
                                  ),
                                  hintText: 'Today',
                                ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    print('selected data is $pickedDate');
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(
                                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    date1Controller.text = formattedDate;
                                    _bloc.updateDate1(formattedDate);
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ),
                            const Icon(
                              Icons.forward_sharp,
                              color: Color(0xff1DA1F2),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextField(
                                style: const TextStyle(color: Colors.black),
                                controller:
                                    date2Controller, //editing controller of this TextField
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                    color: Color(0xff1DA1F2),
                                  ),
                                  hintText: 'No date',
                                ),
                                readOnly:
                                    true, // when true user cannot edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        DateTime.now(), //get today's date
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    print('selected data is $pickedDate');
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(
                                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    date2Controller.text = formattedDate;
                                    _bloc.updateDate2(formattedDate);
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text('Close'),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final save = await _bloc.saveForm();
                            print('bool is ${save}');
                            if (save) {
                              Navigator.pushNamed(context, '/');
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
