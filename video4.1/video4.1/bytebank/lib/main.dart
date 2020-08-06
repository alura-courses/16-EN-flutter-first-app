import 'package:bytebank/textfield.dart';
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ByteBankTextField(
        _nameController,
        "Name",
        "John Doe",
        keyboardType: TextInputType.name,
      ),
      ByteBankTextField(
        _amountController,
        "Amount",
        "0.00",
        icon: Icons.monetization_on,
        keyboardType: TextInputType.number,
      ),
      RaisedButton(
        child: const Text("Add"),
        onPressed: () {
          final name = _nameController.text;
          final amount = double.tryParse(_amountController.text);
          final transaction = _Transaction(name, amount);
          debugPrint("$transaction");
        },
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

  @override
  String toString() {
    return "Transaction[$name $amount]";
  }
}
