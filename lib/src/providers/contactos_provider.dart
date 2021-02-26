import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _ContactosProvider {
  List contactos = [];

  Future<List<dynamic>> leerContactos() async {
    final resp = await rootBundle.loadString('data/contactos.json');
    print(resp);
    Map data = json.decode(resp);
    contactos = data['contactos'];
    return contactos;
  }
}

final contactosProvider = _ContactosProvider();
