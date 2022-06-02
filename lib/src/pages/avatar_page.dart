import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override

  /// It creates a Scaffold with an AppBar, a body and a floatingActionButton.
  ///
  /// Args:
  ///   context (BuildContext): The current context.
  ///
  /// Returns:
  ///   A Scaffold
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(7),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.gq.com.mx/photos/5d73e8c2a18cf800091652cb/master/pass/maxresdefault.jpg'),
              radius: 35.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: const CircleAvatar(
              child: Text('DD'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://sm.ign.com/ign_es/news/b/brazilian-/brazilian-spider-man-no-way-home-trailer-seems-to-include-a_bk8c.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 300),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
