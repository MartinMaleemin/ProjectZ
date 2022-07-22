import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 110,
        child: Builder(builder: (context) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text(
                'test',
                style: TextStyle(color: Colors.amber, fontSize: 30),
              );
            },
          );
        }),
      ),
    );
  }
}
