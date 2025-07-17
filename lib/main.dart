//import 'package:financeapp/home.dart';
//import 'package:financeapp/statistics.dart';
import 'package:financeapp/data/model/add_date.dart';
import 'package:financeapp/widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Bottomnavigationbar());
  }
}
