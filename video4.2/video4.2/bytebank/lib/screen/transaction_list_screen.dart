import 'dart:async';

import 'package:bytebank/screen/transaction_form_screen.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class TransactionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // returning a statefulwidget from a stateless build might be
    // dangerous. in our case it should be ok.
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: _TransactionList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushListScreen(context),
      ),
    );
  }

  void _pushListScreen(BuildContext context) {
    final Future<Transaction> result =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TransactionFormScreen();
    }));
    result.then(_addToTheList);
  }

  void _addToTheList(Transaction value) {
    debugPrint(value.toString());
  }
}

class _TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TransactionListItem(
          Transaction("Alex", 100),
        ),
        _TransactionListItem(
          Transaction("Ana", 550),
        ),
        _TransactionListItem(
          Transaction("Daniela", 1000),
        ),
      ],
    );
  }
}

class _TransactionListItem extends StatelessWidget {
  final Transaction _transaction;

  _TransactionListItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.attach_money),
        title: Text(this._transaction.name),
        subtitle: Text(this._transaction.amount.toString()),
      ),
    );
  }
}
