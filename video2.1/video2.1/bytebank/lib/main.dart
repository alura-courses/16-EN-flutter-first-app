import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ByteBank Transactions"),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Alex"),
                subtitle: Text("100.00"),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.attach_money),
                title: Text("Daniela"),
                subtitle: Text("550.00"),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ),
  );
}
