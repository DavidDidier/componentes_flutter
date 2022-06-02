import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _listNumber = [];
  int _ultimoItem = 0;
  bool _cargando = false;

  @override
  void initState() {
    super.initState();
    _agregar5();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar5();

        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas check'),
      ),
      body: Stack(
        children: <Widget>[
          _crearList(),
          _crearCargando(),
        ],
      ),
    );
  }

  Widget _crearList() {
    return RefreshIndicator(
        onRefresh: obtenerPagina,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _listNumber.length,
            itemBuilder: (BuildContext context, int index) {
              final img = _listNumber[index];
              return FadeInImage(
                  image:
                      NetworkImage('https://picsum.photos/500/300/?image=$img'),
                  placeholder: const AssetImage('assets/jar-loading.gif'));
            }));
  }

  Future<Null> obtenerPagina() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _listNumber.clear();
      _ultimoItem++;
      _agregar5();
    });

    return Future.delayed(duration);
  }

  void _agregar5() {
    for (var i = 0; i < 5; i++) {
      _ultimoItem++;
      _listNumber.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _cargando = true;
    setState(() {});
    const duracion = Duration(seconds: 3);
    return Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    _cargando = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 300));
    _agregar5();
  }

  Widget _crearCargando() {
    if (_cargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[CircularProgressIndicator()],
          ),
          const SizedBox(height: 12.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
