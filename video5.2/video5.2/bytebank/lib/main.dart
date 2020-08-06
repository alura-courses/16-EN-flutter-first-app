import 'package:bytebank/screen/transaction_list_screen.dart';
import 'package:bytebank/textfield.dart';
import 'package:flutter/material.dart';

import 'model.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionListScreen(),
    );
  }
}
