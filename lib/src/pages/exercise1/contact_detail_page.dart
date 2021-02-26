import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/models/contact_model.dart';
import 'package:flutter_application_2/src/shared/utils.dart';

class ContactDetailPage extends StatefulWidget {
  @override
  _ContactDetailPageState createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  final contactsList = [
    ContactModel(
      name: 'Juan',
      img: 'assets/img/avatar.png',
      telephone: '3121234213'
    ),
    ContactModel(
      name: 'Pedro',
      img: '',
      telephone: '321842130'
    ),
    ContactModel(
      name: 'Pablo',
      img: '',
      telephone: '3018469123'
    ),
    ContactModel(
      name: 'David',
      img: 'assets/img/avatar.png',
      telephone: '309840281'
    ),
    ContactModel(
      name: 'Mariana',
      img: '',
      telephone: '31129483721'
    ),
    ContactModel(
      name: 'Julieta',
      img: '',
      telephone: '3041928482'
    )
  ];
  
  @override
  Widget build(BuildContext context) {
    final ContactModel args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail Page'),
      ),
      body: Column(
        children: [
          _createDetailHeader(args),
          SizedBox(height: 20,),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _createDetailBody(),
            ),
          ),
        ],
      ),
      floatingActionButton: _createDetailFooter(),
    );
  }

  Widget _createDetailHeader(ContactModel contact){
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                getContactAvatar(contact),
                SizedBox(width: 20,),
                Text(
                  contact.name,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.phone,),
                SizedBox(width: 25,),
                Text(contact.telephone),
              ],
            )
          ],
        ),
      )
    );
  }

  List<ListTile> _createDetailBody(){
    return contactsList
      .map((contact) => (
        ListTile(
          title: Text(contact.name),
          leading: getContactAvatar(contact),
          trailing: Row( 
            mainAxisSize: MainAxisSize.min,         
            children: <Widget>[
              Icon(Icons.arrow_forward_ios)
            ]
          ),
        )
      ))
      .toList();
  }

  Widget _createDetailFooter(){
    return Container(
      padding: EdgeInsets.all(10),
      child: (
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: () => {},
              child: Icon(Icons.arrow_drop_up, size: 50,),
            ),
            SizedBox(width: 20,),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () => {},
              child: Icon(Icons.arrow_drop_up, size: 50,),
            ),
            SizedBox(width: 20,),
            FloatingActionButton(
              heroTag: 'btn3',
              onPressed: () => {},
              child: Icon(Icons.arrow_drop_up, size: 50,),
            )
          ],
        )
      ),
    );
  }
}