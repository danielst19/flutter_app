import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final list = ['Juan', 'Pedro', 'Pablo', 'David'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Page')
      ),
      body: _createList()
    );
  }

  Widget _createList(){
    final elements = list.map((i) {
      return ListTile(
        title: Text('$i'),
        subtitle: Text('Este es el subtitulo'),
        leading: CircleAvatar(),
      );
    }).toList();

    return ListView(
      children: elements
    );
  }
}