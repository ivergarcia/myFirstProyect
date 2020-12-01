import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MyFirstProgram(),
  ));
}

class MyFirstProgram extends StatefulWidget {
  @override
  _MyFirstProgramState createState() => _MyFirstProgramState();
}

class _MyFirstProgramState extends State<MyFirstProgram> {
  String _inputText1 = "";
  String _inputText2 = "";
  String _labelText = "";
  final TextEditingController controller = new TextEditingController();
  final TextEditingController controller1 = new TextEditingController();

  void _onChanged(String value) {
    setState(() {
      _inputText1 = value;
    });
  }

  void _onChanged2(String value) {
    setState(() {
      _inputText2 = value;
    });
  }

  void limpiar() {
    controller.clear();
    controller1.clear();
  }

  void _sumar() {
    int valor = int.parse(_inputText1);
    int valor2 = int.parse(_inputText2);
    int suma = valor + valor2;
    setState(() {
      _labelText = suma.toString();
      limpiar();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('My First Program'),
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(hintText: "Ingrese un valor"),
                onChanged: (String value) {
                  _onChanged(value);
                },
                controller: this.controller,
              ),
              new TextField(
                decoration: new InputDecoration(hintText: "Ingrese un valor"),
                onChanged: (String value) {
                  _onChanged2(value);
                },
                controller: this.controller1,
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text("Sumar"),
                textColor: Colors.white,
                onPressed: () => _sumar(),
              ),
              Text(_labelText)
            ],
          ),
        ),
      ),
    );
  }
}
