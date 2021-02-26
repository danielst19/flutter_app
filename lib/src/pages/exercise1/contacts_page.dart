import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/models/contact_model.dart';
import 'package:flutter_application_2/src/shared/utils.dart';
import 'package:flutter_application_2/src/widgets/drawer.dart';

class ContactsPage extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts Page'),
      ),
      drawer: getDrawerRoutes(context),
      body: ListView(
        children: contactsList.map((contact) => _createContactList(context, contact)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.dialpad),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: "Favoritos",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Recientes",
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Contactos",
          )
        ],
      ),
    );
  }

  Widget _createContactList(BuildContext context, ContactModel contact){
    return ListTile(
      title: Text(contact.name),
      leading: getContactAvatar(contact),
      onTap: () => {
        Navigator.pushNamed(
          context,
          'contact-detail',
          arguments: contact,
        )
      },
    );
  }
}