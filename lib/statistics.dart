import 'dart:ffi';

import 'package:financeapp/data/top.dart';
import 'package:financeapp/widgets/chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //42:37
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex == index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedIndex == index
                                    ? Color.fromARGB(255, 47, 125, 121)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Expenses',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Chart(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      //57:33
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Spending",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(Icons.swap_vert, color: Colors.grey, size: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  leading: Image.asset(
                    'assets/${geter_top()[index].image!}',
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    geter_top()[index].name!,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    geter_top()[index].time!,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                );
              }, childCount: geter_top().length),
            ),
          ],
        ),
      ),
    );
  }
}
