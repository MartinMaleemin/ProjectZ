import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class addEvent_page extends StatefulWidget {
  const addEvent_page({Key? key}) : super(key: key);

  @override
  State<addEvent_page> createState() => _addEvent_pageState();
}

TextEditingController _eventTitileController = TextEditingController();
TextEditingController _eventLocationController = TextEditingController();
TextEditingController _eventStartController = TextEditingController();
TextEditingController _eventEndController = TextEditingController();
TextEditingController _eventURLController = TextEditingController();
TextEditingController _eventNotesController = TextEditingController();

class _addEvent_pageState extends State<addEvent_page> {
  CalendarFormat format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final _formkey = GlobalKey<FormBuilderState>();

  List<String?> _repeat = [
    'Never',
    'Every Day',
    'Every Week',
    'Every 2 Weeks',
    'Every Month,Every Year'
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
              //app bar
              Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //back
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //community
                          Text(
                            'Add Event',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //title field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: _eventTitileController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Title event has required.");
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _eventTitileController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Title',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //location field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _eventLocationController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Location',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //start
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Container(
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: _eventStartController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Date has required.");
                                    }
                                  },
                                  onSaved: (value) {
                                    _eventStartController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'Start',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? _pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 5),
                                    lastDate:
                                        DateTime(DateTime.now().year + 20));
                                if (_pickedDate != null) {
                                  setState(() {
                                    _eventStartController.text =
                                        DateFormat('d/M/yyy')
                                            .format(_pickedDate);
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.calendar_month_rounded),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //end
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Container(
                              width: 110,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  readOnly: true,
                                  controller: _eventEndController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return ("Date has required.");
                                    }
                                  },
                                  onSaved: (value) {
                                    _eventEndController.text = value!;
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: 'End',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? _pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:
                                        DateTime(DateTime.now().year - 5),
                                    lastDate:
                                        DateTime(DateTime.now().year + 20));
                                if (_pickedDate != null) {
                                  setState(() {
                                    _eventEndController.text =
                                        DateFormat('d/M/yyy')
                                            .format(_pickedDate);
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.calendar_month_rounded),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //repeat opt
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 40),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: Colors.white),
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 0),
              //       child: TextDropdownFormField(
              //         options: [
              //           'Never',
              //           'Every Day',
              //           'Every Week',
              //           'Every 2 Weeks',
              //           'Every Month',
              //           'Every Year'
              //         ],
              //         decoration: InputDecoration(
              //             border: OutlineInputBorder(),
              //             suffixIcon: Icon(Icons.arrow_drop_down),
              //             labelText: "Repeat"),
              //         dropdownHeight: 250,
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),

              //commu
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 40),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         border: Border.all(color: Colors.white),
              //         borderRadius: BorderRadius.circular(12)),
              //     child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: AwesomeDropDown(
              //           selectedItem: 'Community',
              //           selectedItemTextStyle: const TextStyle(
              //               color: Colors.black87,
              //               fontSize: 16,
              //               fontWeight: FontWeight.normal),
              //           elevation: 0,
              //           dropDownList: [
              //             'Never',
              //             'Every Day',
              //             'Every Week',
              //             'Every 2 Weeks',
              //             'Every Month,Every Year'
              //           ],
              //         )),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),

              //alert opt
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: FormBuilderSwitch(
                      inactiveThumbColor: Colors.teal[200],
                      activeColor: Colors.teal[400],
                      inactiveTrackColor: Colors.deepPurple[100],
                      name: 'Notification on',
                      title: Text(
                        'Notification on',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                        ),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //url field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _eventURLController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'URL',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //note field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _eventNotesController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Notes',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              //add event btm
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Add Event',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ])),
          ),
        ));
  }
}
