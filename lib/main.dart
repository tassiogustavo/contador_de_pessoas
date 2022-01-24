import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode entrar";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;
      if (_people < 0) {
        _infoText = "Mundo Invertido?";
      } else if (_people <= 10) {
        _infoText = "Pode entrar";
      } else {
        _infoText = "Está lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Image.network(
            "https://m.extra.globo.com/incoming/25085300-046-075/w488h275-PROP/xmesas-vasto.pagespeed.ic.hjoccu-tro.jpg",
            fit: BoxFit.cover,
            height: 1000,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoas: $_people",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          _changePeople(-1);
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          _changePeople(1);
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 40, color: Colors.black),
                        )),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
