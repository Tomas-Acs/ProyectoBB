import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController name = TextEditingController();
  TextEditingController div = TextEditingController();
  TextEditingController rolln = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('users');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar usuario'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Nombre',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                textAlign: TextAlign.center,
                controller: rolln,
                decoration: InputDecoration(
                  hintText: 'Numero de asistencia',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Sede : '),
                    DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 28, 170, 73),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Color.fromARGB(255, 1, 1, 255),
                      focusColor: Color.fromARGB(255, 0, 17, 251),
                      items: options.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Color.fromARGB(255, 11, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
                  ],
                ),
                SizedBox(
                  width: 35,
                ),
                Row(
                  children: [
                    Text('Servicio : '),
                    DropdownButton<String>(
                      dropdownColor: Color.fromARGB(255, 28, 170, 73),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                      items: options1.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
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
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Color.fromARGB(255, 2, 11, 128),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                ref.add({
                  'name': name.text,
                  'div': ww,
                  'roll': rolln.text,
                });
              },
              child: Text(
                'Agregar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}