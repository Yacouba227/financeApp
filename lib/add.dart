import 'dart:math';

import 'package:financeapp/data/model/add_date.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final box = Hive.box<Add_data>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();

  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();

  final List<String> _item = ['cart', 'code', "programmation", "computer"];
  final List<String> _itemei = ['income', 'expand'];
  @override
  void initState() {
    super.initState();
    selectedItem = _item[0];
    ex.addListener(() {
      if (ex.hasFocus) {
        setState(() {});
      }
    });
    amount_.addListener(() {
      if (ex.hasFocus) {
        setState(() {});
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //1:09:00
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(top: 120, child: main_container()),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 300,
      height: 520,
      child: Column(
        children: [
          SizedBox(height: 50),
          name(),
          SizedBox(height: 20),
          explain(),
          SizedBox(height: 20),
          amount(),
          SizedBox(height: 20),
          How(),
          SizedBox(height: 20),
          date_time(),
          Spacer(),
          save(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(selectedItemi!, amount_c.text, date as String, expalin_C.text, selectedItem as DateTime);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xff368983),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Save',
          style: TextStyle(
            fontFamily: 'f',
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Color(0xffC5C5C5)),
      ),
      width: 265,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (newDate == null) return;
          setState(() {
            date = newDate;
          });
        },
        child: Text(
          "Date: ${date.day}/${date.month}/${date.year}",
          style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Padding How() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5)),
        ),
        child: DropdownButton<String>(
          value: selectedItemi,
          onChanged: ((value) {
            setState(() {
              selectedItemi = value!;
            });
          }),
          items: _itemei
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 30,
                          child: Image.asset('assets/images/${e}.png'),
                        ),
                        SizedBox(width: 10),
                        Text(e, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  value: e,
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemei
              .map(
                (e) => Row(
                  children: [
                    Container(
                      width: 40,
                      child: Image.asset('assets/images/${e}.png'),
                    ),
                    SizedBox(width: 10),
                    Text(e),
                  ],
                ),
              )
              .toList(),
          hint: Text("How", style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          //value: selectedItem,
          /* onChanged: ((value) {
              setState(() {
                selectedItem = value!;
              });
            }), */
        ),
      ),
    );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: "Amount",
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
          ),
          /* border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
            ), */
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: "Explain",
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xff368983)),
          ),
          /* border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5)),
              ), */
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5)),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
          }),
          items: _item
              .map(
                (e) => DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          child: Image.asset('assets/images/${e}.png'),
                        ),
                        SizedBox(width: 10),
                        Text(e, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                  value: e,
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map(
                (e) => Row(
                  children: [
                    Container(
                      width: 40,
                      child: Image.asset('assets/images/${e}.png'),
                    ),
                    SizedBox(width: 10),
                    Text(e),
                  ],
                ),
              )
              .toList(),
          hint: Text("Name", style: TextStyle(color: Colors.grey)),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          //value: selectedItem,
          /* onChanged: ((value) {
                setState(() {
                  selectedItem = value!;
                });
              }), */
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: const BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      "Adding",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.attach_file_outlined, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
