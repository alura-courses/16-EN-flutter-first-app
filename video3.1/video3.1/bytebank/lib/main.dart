import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _TransactionFormScreen(),
    );
  }
}

class _TransactionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New transaction"),
      ),
      body: _TransactionForm(),
    );
  }
}

class _TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            labelText: "Name",
            hintText: "John Doe",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            icon: Icon(Icons.monetization_on),
            labelText: "Amount",
            hintText: "0.00",
          ),
          keyboardType: TextInputType.number,
        ),
      ),
      RaisedButton(
        child: Text("Add"),
      )
    ]);
  }
}

class _TransactionListScreen extends StatelessWidget {
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
      ),
    );
  }
}

class _TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TransactionListItem(
          _Transaction("Alex", 100),
        ),
        _TransactionListItem(
          _Transaction("Ana", 550),
        ),
        _TransactionListItem(
          _Transaction("Daniela", 1000),
        ),
      ],
    );
  }
}

class _TransactionListItem extends StatelessWidget {
  final _Transaction _transaction;

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

class _Transaction {
  final String name;

  // double has problems with precision
  final double amount;

  _Transaction(this.name, this.amount);
}
