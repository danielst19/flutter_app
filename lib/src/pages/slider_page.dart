import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 30;
  bool _checked = false;
  bool _switched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Page'),
      ),
      body: Column(
        children: [
          _createSlider(),
          _createCheckbox(),
          _createSwitch(),
          _createImage()
        ]
      ),
    );
  }

  Widget _createSlider(){
    return Slider(
      value: _value,
      label: '$_value',
      divisions: 4,
      min: 30,
      max: 300,
      activeColor: Colors.red,
      onChanged: _checked || _switched ? null : (double newValue){
        _value = newValue;
        setState(() {});
      },
    );
  }

  Widget _createCheckbox(){
    /* return Checkbox(
      value: _checked,
      onChanged: (bool checked){
        _checked = checked;
        setState(() {});
      }
    ); */

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      value: _checked,
      onChanged: (bool checked){
        _checked = checked;
        setState(() {});
      }
    );
  }

  Widget _createImage(){
    return Image.asset(
      'assets/img/pokeball.png',
      fit: BoxFit.contain,
      width: _value,
    );
  }

  Widget _createSwitch(){
    return SwitchListTile(
      title: Text('Bloquear slider'),
      value: _switched,
      onChanged: (bool switched){
        _switched = switched;
        setState(() {});
      }
    );
  }
}