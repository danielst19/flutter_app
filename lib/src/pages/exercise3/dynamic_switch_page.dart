import 'package:flutter/material.dart';

class DynamicSwitchPage extends StatefulWidget {
  DynamicSwitchPage({Key key}) : super(key: key);

  @override
  _DynamicSwitchPageState createState() => _DynamicSwitchPageState();
}

class _DynamicSwitchPageState extends State<DynamicSwitchPage> {
  List<bool> _switchList = [];
  int _lastPositionSwitchOn = 0;

  @override
  Widget build(BuildContext context) {
    final int quantitySwitch = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Switch Page'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => _createSwitch(index),
        itemCount: quantitySwitch,
      ),
    );
  }

  Widget _createSwitch(int index){
    _switchList.add(false);

    return SwitchListTile(
      title: Text('Switch ${index + 1}'),
      value: _switchList[index],
      onChanged: index < _lastPositionSwitchOn ? null : (bool switched){
        _switchList[index] = switched;
        _lastPositionSwitchOn = !switched ? 0 : index;
        setState(() {});
      }
    );
  }

}