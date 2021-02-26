import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/providers/menu_provider.dart';
import 'package:flutter_application_2/src/shared/icons.dart';

Widget _createList(BuildContext context) {
  return FutureBuilder(
    future: menuProvider.readMenuOptions(),
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      return Column(children: _createOptions(snapshot.data, context));
    },
  );
}

List<Widget> _createOptions(List<dynamic> data, BuildContext context) {
  List<Widget> options = [];

  data.forEach((i) {
    options.add(ListTile(
      leading: getIcon(iconName: i['icon']),
      title: Text(i['text']),
      onTap: () {
        Navigator.pushNamed(context, i['path']);
      },
    ));
  });

  return options;
}

getDrawerRoutes(BuildContext context){
  return (
    Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _createList(context)
          /* ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ), */
        ],
      ),
    )
  );
}