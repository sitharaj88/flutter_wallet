import 'package:finance_app_ui/cards.dart';
import 'package:flutter/material.dart';

import 'budgetchart.dart';
import 'home.dart';

void main() => runApp(FinanceApp());

class FinanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletAppHome(),
    );
  }
}
