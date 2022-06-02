// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _correo = '';
  String _date = '';
  final List<String> _poderes = ['Volar', 'Rayos X', 'Super fuerza'];
  String _opcionSeleccionada = 'Seleccione';
  TextEditingController _entradaFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
        children: <Widget>[
          _crearEntrada(),
          const Divider(),
          _crearCorreo(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearDate(),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPerson(),
        ],
      ),
    );
  }

  /// It creates a text field.
  ///
  /// Returns:
  ///   A TextField widget.
  Widget _crearEntrada() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Digite nombre',
        labelText: 'Primer nombre',
        helperText: 'Solo su primer nombre',
        suffixIcon: const Icon(Icons.accessibility_new),
        icon: const Icon(Icons.account_circle_sharp),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  /// It creates a text field for the user to enter their email address.
  ///
  /// Returns:
  ///   A TextField widget.
  Widget _crearCorreo() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: 'ejemplo@ejemplo.com',
          labelText: 'E-mail',
          helperText: 'Ingrese un correo valido',
          suffixIcon: const Icon(Icons.email_outlined),
          icon: const Icon(Icons.email_outlined)),
      onChanged: (valor) {
        setState(() {
          _correo = valor;
        });
      },
    );
  }

  /// It creates a text field that is used to enter a password.
  ///
  /// Returns:
  ///   A TextField widget.
  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      obscuringCharacter: '*',
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: 'Escriba su contraseña',
          labelText: 'Contraseña',
          helperText: 'Minimo 8 caracteres',
          suffixIcon: const Icon(Icons.password_outlined),
          icon: const Icon(Icons.password)),
    );
  }

  /// It creates a text field that allows the user to select a date.
  ///
  /// Returns:
  ///   A TextField widget.
  Widget _crearDate() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _entradaFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        helperText: 'AAAA/MM/DD',
        suffixIcon: const Icon(Icons.calendar_today_sharp),
        icon: const Icon(Icons.calendar_month),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccioneFecha(context);
      },
    );
  }

  /// A function that allows you to select a date from a calendar.
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget that calls the showDatePicker() method.
  _seleccioneFecha(BuildContext context) async {
    DateTime? select = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      locale: const Locale('es', 'ES'),
    );

    if (select != null) {
      setState(() {
        _date = select.toString();
        _entradaFieldDateController.text = _date;
      });
    }
  }

  /// It creates a list of DropdownMenuItem objects.
  ///
  /// Returns:
  ///   A list of DropdownMenuItem
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> _lista = [];

    _poderes.forEach((poder) {
      _lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return _lista;
  }

  /// It creates a dropdown menu.
  ///
  /// Returns:
  ///   A list of DropdownMenuItem
  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
                //value: 'Seleccione',
                items: getOpcionesDropdown(),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionada = opt.toString();
                  });
                }))
      ],
    );
  }

  /// It creates a ListTile widget with the title, subtitle and trailing text.
  ///
  /// Returns:
  ///   A ListTile widget.
  Widget _crearPerson() {
    return ListTile(
      title: Text('El nombre es: $_nombre'),
      subtitle: Text('El correo es: $_correo'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
