import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          onPressed: (){
            _showAlert(context);
          },
          color: Colors.red,
          textColor: Colors.white,
        ),
      )
    );
  }

  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('Confirmar cambios'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Estás seguro de guardar los cambios?'),
              FlutterLogo(size: 80)
            ]
          ),
          actions: [
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () => {},
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: () => {},
            )
          ]
        );
      }
    );
  }
}