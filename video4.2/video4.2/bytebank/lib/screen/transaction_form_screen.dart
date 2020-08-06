import 'package:flutter/material.dart';

import '../model.dart';
import '../textfield.dart';

class TransactionFormScreen extends StatelessWidget {
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
        onPressed: () => _popTransaction(context),
      )
    ]);
  }

  _popTransaction(BuildContext context) {
    final name = _nameController.text;
    final amount = double.tryParse(_amountController.text);
    if (name == null || amount == null) {
      return;
    }

    final transaction = Transaction(name, amount);
//          debugPrint("$transaction");
    Navigator.pop(context, transaction);
  }
}
