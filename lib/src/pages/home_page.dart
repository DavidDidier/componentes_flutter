import 'package:componentes_flutter/src/providers/menu_provaider.dart';
import 'package:componentes_flutter/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opcs);
    return FutureBuilder<List<dynamic>>(
      future: menuProvider.cargarData(),
      initialData: const [], //Argumento opcional
      builder: (context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> datos, BuildContext context) {
    return datos.map((opt) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt['texto']),
            leading: getIcon(opt['icon']),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined,
                color: Colors.blueAccent),
            onTap: () {
              Navigator.pushNamed(context, opt['ruta']);
              //final route =
              //  MaterialPageRoute(builder: (context) => const AlertaPage());
              //Navigator.push(context, route);
            },
          ),
          const Divider()
        ],
      );
    }).toList();
  }
}
