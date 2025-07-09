import 'package:financeapp/add.dart';
import 'package:financeapp/home.dart';
import 'package:financeapp/statistics.dart';
import 'package:flutter/material.dart';

class Bottomnavigationbar extends StatefulWidget {
  const Bottomnavigationbar({Key? key}) : super(key: key);

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  int index_color = 0;
  List Screen = [Home(), Statistics(), Home(), Statistics()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add screen
          /* Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Add()),
          ); */
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const Add()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xff368983),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle home button tap
                  setState(() {
                    index_color = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30,
                  color: index_color == 0 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle home button tap
                  setState(() {
                    index_color = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30,
                  color: index_color == 1 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  // Handle home button tap
                  setState(() {
                    index_color = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 30,
                  color: index_color == 2 ? Color(0xff368983) : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle home button tap
                  setState(() {
                    index_color = 3;
                  });
                },
                child: Icon(
                  Icons.percent_outlined,
                  size: 30,
                  color: index_color == 3 ? Color(0xff368983) : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
