import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

/// _ProviderMenu is a class that has a list of dynamic objects called opcs. It has a constructor that
/// calls cargarData() and a method called cargarData() that loads a JSON file and returns a list of
/// dynamic objects
class _ProviderMenu {
  List<dynamic> opcs = [];

  _ProviderMenu() {
    //cargarData();
  }

  Future<List> cargarData() async {
    final resp = await rootBundle.loadString('data/opciones_menu.json');

    Map dataMap = json.decode(resp);
    opcs = dataMap['rutas'];
    return opcs;
  }
}

final menuProvider = _ProviderMenu();
