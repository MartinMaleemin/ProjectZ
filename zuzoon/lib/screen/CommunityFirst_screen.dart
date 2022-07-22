import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:provider/provider.dart';
import 'package:zuzoon/model/Community_data.dart';
import 'package:zuzoon/provider/community_provider.dart';
import 'package:zuzoon/screen/CommunityCreate_screen.dart';

class communityFirst_page extends StatefulWidget {
  const communityFirst_page({Key? key}) : super(key: key);

  @override
  State<communityFirst_page> createState() => _communityFirst_pageState();
}

class _communityFirst_pageState extends State<communityFirst_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
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
                          'Comunity',
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
              height: 40,
            ),
            Consumer(
              builder: (context, communityProvider provider, Widget? child) {
                var count = provider.community_data.length;
                if (count <= 0) {
                  //commu
                  return Column(children: [
                    Icon(
                      Icons.cottage_rounded,
                      color: Colors.teal[400],
                      size: 150,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //text
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(
                              "Looks like you don't have a any Community right now.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ]),
                  ]);
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 450,
                      child: Builder(
                        builder: (context) {
                          return ListView.builder(
                            itemCount: count,
                            itemBuilder: (BuildContext context, int index) {
                              Community_data data =
                                  provider.community_data[index];
                              return Card(
                                borderOnForeground: false,
                                color: Colors.grey[200],
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(35),
                                      bottomRight: Radius.circular(35),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.deepPurple[200],
                                          radius: 80,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: ListTile(
                                            title: Text(
                                              '${data.c_title}',
                                              style: TextStyle(
                                                color: Colors.teal[400],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            subtitle: Text(
                                              '${data.c_desciption}',
                                              style: TextStyle(
                                                color: Colors.deepPurple[300],
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.teal[400],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),

            SizedBox(
              height: 60,
            ),

            //join btm
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Join',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.teal[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //creat btm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/createCommunity');
                    },
                    child: Container(
                      width: 120,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.teal[400],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ])),
        ));
  }
}
