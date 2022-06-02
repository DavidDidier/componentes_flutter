import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValor = 1.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearCheckBox() {
    //return Checkbox(
    //  value: _blockCheck,
    // onChanged: (valor) {
    // setState(() {
    // _blockCheck = valor!;
    // });
    //});
    return CheckboxListTile(
        value: _blockCheck,
        title: const Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(() {
            _blockCheck = valor!;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        value: _blockCheck,
        title: const Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(() {
            _blockCheck = valor;
          });
        });
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.greenAccent,
        label: 'Tamaño imagen',
        //divisions: 25,
        value: _sliderValor,
        min: 1.0,
        max: 500.0,
        onChanged: (_blockCheck)
            ? null
            : (valor) {
                setState(() {
                  _sliderValor = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: const NetworkImage(
          'https://es.web.img2.acsta.net/pictures/21/12/01/12/07/0243323.jpg'),
      width: _sliderValor,
      fit: BoxFit.contain,
    );
  }
}
