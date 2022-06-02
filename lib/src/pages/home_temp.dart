import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({Key? key}) : super(key: key);

  final opciones = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes Temp'),
      ),
      body: ListView(children: _crearItemsFlash()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];

    for (var item in opciones) {
      final widgetTemp = ListTile(
        title: Text(item),
      );

      lista
        ..add(widgetTemp)
        ..add(const Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsFlash() {
    return opciones.map((e) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(e + ' !'),
            subtitle: const Text('Lo que sea'),
            leading: const Icon(Icons.account_balance_wallet_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {},
          ),
          const Divider()
        ],
      );
    }).toList();
  }
}
