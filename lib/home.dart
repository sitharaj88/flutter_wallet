import 'dart:ui';
import 'dart:math';

import 'package:finance_app_ui/budgetchart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'cards.dart';

class WalletAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalletAppHomeState();
  }
}

class WalletAppHomeState extends State<WalletAppHome> {
  int _selectedIndex = 0;
  var walletWidgets = <Widget>[];

  WalletAppHomeState() {
    walletWidgets.add(homeWidget());
    walletWidgets.add(FinanceCards());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_sharp),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Cards',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff30bc97),
        onTap: _onItemTapped,
      ),
      body: walletWidgets[_selectedIndex],
    );
  }

  Widget homeWidget() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      color: Color(0xfff7f6f7),
      child: SingleChildScrollView(
        child: Container(
          color: Color(0xfff7f6f7),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: header(),
              ),
              SizedBox(
                height: 20,
              ),
              card("\$8,588.00", "****7496", 0xff30bc97),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: balanceSheet(),
              ),
              SizedBox(
                height: 30,
              ),
              WalletChart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.rotate(
          angle: 90 * pi / 180,
          child: Icon(
            Icons.settings_input_component_sharp,
            color: Colors.grey,
            size: 30,
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('images/profile.png'),
        ),
      ],
    );
  }

  Widget card(String amount, String cardNumber, int cardColor) {
    return Card(
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(0))),
      color: Color(0xff2307bb),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Budget',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 8, right: 3, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Color(0xff0f0151),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Row(
                    children: [
                      Text(
                        'USD',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "\$5,554.00",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Last Payment',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "15,985.00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    '+12%',
                    style: TextStyle(color: Color(0xff2307bb)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget balanceSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Total Balance',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff2307bb),
              fontSize: 25),
        ),
        SizedBox(
          height: 35,
        ),
        Row(
          children: [
            dayWidget('Today', Colors.white.value, 0xff2307bb, 0xff2307bb),
            dayWidget('Week', Colors.grey.value, Colors.white.value,
                Colors.grey.value),
            dayWidget('Month', Colors.grey.value, Colors.white.value,
                Colors.grey.value),
          ],
        )
      ],
    );
  }

  Widget dayWidget(String text, int textColor, int color, int borderColor) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [BoxShadow(spreadRadius: 1, color: Color(borderColor))],
          color: Color(color)),
      child: Text(
        text,
        style: TextStyle(color: Color(textColor)),
      ),
    );
  }
}
