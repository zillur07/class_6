import 'package:contact_list/src/controllers/numberController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  final _numberController = Get.put(NumberController());
  final myTextRemoveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _numberController.contactList();
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Contacts',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white70,
      ),
      body: Obx(() => Column(
            // children: [
            //   Center(
            //     child: Text(
            //       '${_numberController.name}',
            //       style: TextStyle(
            //         fontSize: 50,
            //       ),
            //     ),
            //   ),
            //   Container(
            //     height: 200,
            //     width: 200,
            //     color: _numberController.color.value,
            //   )
            // ],

            children: [
              // Center(
              //   child: Text(
              //     "",
              //     style: TextStyle(
              //       fontSize: 50,
              //     ),
              //   ),
              // ),
              // Container(
              //   height: 200,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: _numberController.isOnline.value == true
              //         ? Colors.green
              //         : Colors.grey,
              //   ),
              // ),
              // Text('${_numberController.isOnline.value}'),
              // CupertinoSwitch(
              //     value: _numberController.isOnline.value,
              //     //value: false,
              //     onChanged: (v) {
              //       _numberController.manageColor();
              //     }),
              // SizedBox(
              //   height: 50,
              // ),
              // Container(
              //   child: Text(
              //     _numberController.yourSubject.value == true ? 'CSE' : 'EEE',
              //     style: TextStyle(
              //       color: _numberController.yourSubject.value == true
              //           ? Colors.purple
              //           : Colors.pinkAccent,
              //       fontSize: 50,
              //     ),
              //   ),
              // ),
              // Text('${_numberController.yourSubject.value}'),
              // Switch(
              //     value: _numberController.yourSubject.value,
              //     //value: false,
              //     onChanged: (v) {
              //       _numberController.manageSubject();
              //     }),
              // Checkbox(
              //     value: _numberController.yourSubject.value,
              //     //value: false,
              //     onChanged: (v) {
              //       _numberController.manageSubject();
              //     }),

              SizedBox(
                height: 15,
              ),
              Text(
                'Contact list',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orangeAccent,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: _numberController.name,
                      decoration: InputDecoration(
                          fillColor: Colors.white70,
                          filled: true,
                          hintText: 'Enter Your Name',
                          errorText: _numberController.name.value.isEmpty
                              ? 'Please Enter your name'
                              : null,
                          suffixIcon: IconButton(
                              color: _numberController.name.value.isEmpty
                                  ? Colors.grey
                                  : Colors.green,
                              icon: Icon(Icons.send),
                              onPressed: () {
                                myTextRemoveController.clear();
                                _numberController.addName();
                              })),
                      controller: myTextRemoveController,
                      onSubmitted: (value) {
                        // myTextRemoveController.clear();
                        // _numberController.addName(value);
                      },
                    ),
                  ],
                ),
              ),
              _numberController.contactList.isEmpty
                  ? Text(
                      'No Contact List',
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _numberController.contactList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = _numberController.contactList[index];
                        return ListTile(
                          onTap: () {
                            _numberController.deleteContact(item);
                          },
                          title: Text(
                            '$item',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                          leading: Icon(
                            Icons.person,
                          ),
                        );
                      }),
            ],
          )),
    );
  }
}
