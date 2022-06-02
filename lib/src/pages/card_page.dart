import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: <Widget>[
          _cardTipo1(),
          const SizedBox(
            height: 30.0,
          ),
          _cardTipo2()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  /// It creates a card with a title, subtitle, and two buttons.
  ///
  /// Returns:
  ///   A card with a title, subtitle and two buttons.

  Widget _cardTipo1() {
    return Card(
      elevation: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.photo_album_outlined, color: Colors.blueAccent),
            title: Text('Titulo ome'),
            subtitle: Text(
                'Joa estas avanzando rapido Didier, eres el mejor recuerdalo siempre ome, no lo olvides'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  /// It creates a card with a picture and a text.
  ///
  /// Returns:
  ///   A Container with a BoxDecoration and a ClipRRect with a child of a Container.
  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        //clipBehavior: Clip.antiAlias,
        children: <Widget>[
          const FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://www.capturelandscapes.com/wp-content/uploads/2016/08/arctic-fire-1068x652.jpg'),
            fadeInDuration: Duration(milliseconds: 250),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: const Text('Joa aqui pongo lo que sea'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.greenAccent,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                offset: Offset(2.0, 5.0),
                color: Colors.greenAccent,
                blurRadius: 10.0,
                spreadRadius: 2.0)
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: card,
      ),
    );
  }
}
