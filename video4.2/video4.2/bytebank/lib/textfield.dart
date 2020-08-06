import 'package:flutter/material.dart';

class ByteBankTextField extends StatelessWidget {
  final TextEditingController _nameController;
  final String _label;
  final String _hint;
  final IconData icon;
  final TextInputType keyboardType;

  ByteBankTextField(this._nameController, this._label, this._hint, {this.icon, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _nameController,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          icon: _icon(),
          labelText: _label,
          hintText: _hint,
        ),
      ),
    );
  }

  Icon _icon() {
    if (icon == null) {
      return null;
    }
    return Icon(icon);
  }
}
