import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String fieldValue = '';
  String emailValue = '';
  String passwordValue = '';
  String numberValue = '';
  String dateValue = '';
  String itemSelected = 'Azul';
  final itemsList = ['Azul', 'Verde'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Page')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          children: [
            Text(fieldValue),
            _createInput(),
            Divider(),
            _createInputEmail(),
            Divider(),
            _createInputPassword(),
            Divider(),
            _createInputNumber(),
            Divider(),
            Text(dateValue),
            _createDateInput(context),
            Divider(),
            _createDropdown()
          ]
        )
      )
    );
  }

  Widget _createInput(){
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        labelText: 'Label',
        hintText: 'Hint',
        helperText: 'Helper',
        //icon: Icon(Icons.account_balance_wallet_outlined),
        suffixIcon: Icon(Icons.account_balance_wallet_outlined)
      ),
      onChanged: (value) {
        fieldValue = value;
        setState(() {});
      },
    );
  }

  Widget _createInputEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Label',
        hintText: 'Hint',
        helperText: 'Helper',
        icon: Icon(Icons.mail)
      ),
      onChanged: (value) {
        emailValue = value;
        setState(() {});
      },
    );
  }

  Widget _createInputPassword(){
    return TextField(
      obscureText: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Label',
        hintText: 'Hint',
        helperText: 'Helper',
        icon: Icon(Icons.lock)
      ),
      onChanged: (value) {
        passwordValue = value;
        setState(() {});
      },
    );
  }

  Widget _createInputNumber(){
    return TextField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Label',
        hintText: 'Hint',
        helperText: 'Helper',
        icon: Icon(Icons.lock)
      ),
      onChanged: (value) {
        numberValue = value;
        setState(() {});
      },
    );
  }

  Widget _createDateInput(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        labelText: 'Label',
        hintText: 'Hint',
        helperText: 'Helper',
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _showDatePicker(context);
      },
    );
  }

  void _showDatePicker(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025)
    );

    if(date != null){
      DateFormat dateFormat = DateFormat('yyy-MM-dd');
      dateValue = dateFormat.format(date);
      setState(() {});
    }
  }

  Widget _createDropdown(){
    return Expanded(
      child: DropdownButton(
        value: itemSelected,
        items: _createItemsDropdown(),
        onChanged: (option) {
          itemSelected = option;
          setState(() {});
        },
      )
    );
  }

  List<DropdownMenuItem>_createItemsDropdown(){
    List<DropdownMenuItem<String>> items = List();
    itemsList.forEach((s){
      final item = DropdownMenuItem(
        child: Text(s),
        value: s
      );

      items.add(item);
    });

    return items;
  }

}