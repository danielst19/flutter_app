import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int buttonActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            Text(
              'Step',
              style: TextStyle(
                fontSize: 20
              )
            ),
            Text('$buttonActive', style: Theme.of(context).textTheme.headline4)
          ],
        ),
      ),
      floatingActionButton: _renderButtons(),
    );
  }

  selectedOption(int option) {
    buttonActive = option;
    setState(() {});
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Widget _renderButtons() {
    List<Widget> widgets = [];

    for(int i = 0; i<5; i++){
      Color color = buttonActive == i ? Colors.blue : _colorFromHex('#000000');

      widgets.add(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: FloatingActionButton(
            onPressed: i == 2 ? null : () => selectedOption(i),
            child: Text('${i.toString()}'),
            backgroundColor: color,
          ),
        )
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets
    );
  }
}
