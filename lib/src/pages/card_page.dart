import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final list = ['Juan', 'Pedro', 'Pablo', 'David'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Page')),
      body: _createLocalList()
    );
  }

  Widget _createLocalList(){
    List<Widget> elements = [];

    for(String s in list){
      elements
        ..add(_createCard(s))
        ..add(SizedBox(
          height: 50,
        ));
    }

    return ListView(children: elements);
  }

  Widget _createCard(String title){
    return Card(
      elevation: 20,
      child: Column(
        children: [
          ListTile(
            title: Text('$title'),
            subtitle: Text('Este es el subtitulo'),
            leading: CircleAvatar(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () => {},
                child: Text('Acción 1'),
                textColor: Colors.blueAccent,
              ),
              FlatButton(
                onPressed: () => {},
                child: Text('Acción 2'),
                textColor: Colors.red,
              )
            ]
          )
        ],
      )
    );
  }
}