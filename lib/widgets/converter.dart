import 'dart:ui';

import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = "0";
  // _decimal = int.parse(_binary, radix: 2).toRadixString(10);
  String _decimal = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                '$_decimal',
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                '$_binary',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: MaterialButton(
                  color: Colors.blue[100],
                  child: Text("1"),
                  onPressed: () {
                    setState(() {
                      _binary = _binary + "1";
                      convertToDecimal();
                    });
                  },
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: MaterialButton(
                  color: Colors.blue[100],
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _binary = _binary + "0";
                      convertToDecimal();
                    });
                  },
                ),
              ),
            ]),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: MaterialButton(
                      color: Colors.blue[800],
                      onPressed: () {
                        setState(() {
                          _binary = "0";
                          _decimal = "0";
                        });
                      },
                      child: Text(
                        "Reset all",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: MaterialButton(
                      color: Colors.blue[800],
                      onPressed: () {
                        setState(() {
                          if (_binary.length == 1) {
                            _binary = "0";
                          }
                          if (_binary.length > 1) {
                            _binary = _binary.substring(0, _binary.length - 1);
                          }
                          convertToDecimal();
                        });
                      },
                      child: Text(
                        "Delete last",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void convertToDecimal() {
    setState(() {
      _decimal = int.parse(_binary, radix: 2).toRadixString(10);
    });
  }
}
