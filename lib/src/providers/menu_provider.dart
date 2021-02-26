import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List options = [];

  Future<List<dynamic>> readMenuOptions() async {
    final resp = await rootBundle.loadString('data/menu.json');
    Map data = json.decode(resp);
    options = data['menu'];
    return options;
  }
}

final menuProvider = _MenuProvider();