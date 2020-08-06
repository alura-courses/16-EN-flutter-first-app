import 'dart:async';

import 'package:bytebank/screen/transaction_form_screen.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class TransactionListScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TransactionListScreen();
  }
}

class _TransactionListScreen extends State<StatefulWidget>{

  final transactions = List<Transaction>();

  @override
  Widget build(BuildContext context) {
    debugPrint("building the state");
    return Scaffold(
      appBar: AppBar(
        title: Text("Transactions"),
      ),
      body: _TransactionList(transactions),
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
    if(value == null) {
      return;
    }
    debugPrint(value.toString());
    debugPrint("about to add something to the transaction");
    setState(() {
      debugPrint("set state begin");
      transactions.add(value);
      debugPrint("setState after ${transactions.toString()}");
    });
    debugPrint("addToTheList after ${transactions.toString()}");
  }

}

class _TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  _TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _transactions.length,
      itemBuilder: (BuildContext context, int index) {
        return _TransactionListItem(_transactions[index]);
      },
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
