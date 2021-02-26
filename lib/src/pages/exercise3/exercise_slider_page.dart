import 'package:flutter/material.dart';

class ExerciseSliderPage extends StatefulWidget {
  ExerciseSliderPage({Key key}) : super(key: key);

  @override
  _ExerciseSliderPageState createState() => _ExerciseSliderPageState();
}

class _ExerciseSliderPageState extends State<ExerciseSliderPage> {
  int _value = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Slider Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _createSlider(),
          SizedBox(height: 30),
          RaisedButton(
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red)
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'dynamic-switch', arguments: _value);
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              child: const Text(
                'Siguiente',
                style: TextStyle(fontSize: 20, color: Colors.white)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createSlider(){
    return Slider(
      value: _value.toDouble(),
      label: '$_value',
      divisions: 20,
      min: 5,
      max: 20,
      onChanged: (double newValue){
        _value = newValue.toInt();
        setState(() {});
      },
    );
  }
}