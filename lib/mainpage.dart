import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'makepdf.dart';

class mainpage extends StatefulWidget {
  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  var ww = 'HatilloCuido';
  var options = [
    'Hatillo',
    'Nueva',
  ];
  var _currentItemSelected = "Hatillo";
  var rool = "Hatillo";

  var options1 = [
    'Cuido',
    'Desayuno',
    'Almuerzo',
  ];
  var _currentItemSelected1 = "Cuido";
  var rool1 = "Cuido";

  var temp = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where(
      'div',
      isEqualTo: ww,
    )
        .snapshots();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => reportt(
                  list: temp,
                  clas: ww,
                ),
              ),
            );
          },
          child: Icon(
            Icons.send,
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Registros',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.blue[900],
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
                items: options.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected) {
                  setState(() {
                    _currentItemSelected = newValueSelected!;
                    rool = newValueSelected;

                    ww = '';
                    ww = _currentItemSelected + _currentItemSelected1;
                  });
                  print(ww);
                },
                value: _currentItemSelected,
              ),
              SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.blue[900],
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
                items: options1.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(
                      dropDownStringItem,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValueSelected1) {
                  setState(() {
                    _currentItemSelected1 = newValueSelected1!;
                    rool1 = newValueSelected1;
                    ww = '';
                    ww = _currentItemSelected + _currentItemSelected1;
                  });
                  print(ww);
                },
                value: _currentItemSelected1,
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      // 1019
                      setState(() {
                        if (temp.contains(
                            snapshot.data!.docChanges[index].doc['name'])) {
                          temp.remove(
                              snapshot.data!.docChanges[index].doc['name']);
                        } else {
                          temp.add(
                              snapshot.data!.docChanges[index].doc['name']);
                        }
                      });
                      print(temp);
                      setState(() {});
                    },
                    child: Card(
                      child: ListTile(
                        title:
                        Text(snapshot.data!.docChanges[index].doc['name']),
                        trailing: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: temp.contains(snapshot
                                .data!.docChanges[index].doc['name'])
                                ? Color.fromARGB(255, 187, 40, 30)
                                : Color.fromARGB(255, 28, 170, 73),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              temp.contains(snapshot
                                  .data!.docChanges[index].doc['name'])
                                  ? 'Remover'
                                  : 'Presente',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}