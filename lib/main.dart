import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      home: CurrencyConverter(),
    ));

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Currency Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String message;
  double changed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset('assets/money.jpg', width: 600, height: 240, fit: BoxFit.cover),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.blueGrey[900],
                  letterSpacing: 1.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter the amount in EUR',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  setState(() {
                    message = value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty ||
                      value.contains('..') ||
                      value.contains(',') ||
                      value.contains('-') ||
                      value.contains(' ')) {
                    return 'Please Enter a number';
                  }
                  return null;
                },
              ),
            ),
            FlatButton(
              textTheme: ButtonTextTheme.accent,
              color: Colors.grey,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    changed = double.tryParse(message);
                  });
                }
              },
              child: const Text('CONVERT!'),
            ),
            if (changed != null)
              Text(
                '${changed * 4.87} RON',
                textScaleFactor: 3,
                style: const TextStyle(color: Colors.pink),
              ),
          ],
        ),
      ),
    );
  }
}
