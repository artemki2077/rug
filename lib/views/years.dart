import 'package:flutter/material.dart';
import 'package:rug/globals.dart' as globals;
import 'home.dart';
import 'MontashZP/Montash_ZP.dart';
import 'RujNal/RujNal.dart';
import 'Banki/sber.dart';
import 'Banki/Alfa.dart';
import 'podelili.dart';

class Year extends StatefulWidget {
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> kk() {
    List<Widget> yearButtons = <Widget>[];
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.url21_22;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home(ended: false,)));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text("Не ended")))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.url21_22;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home(ended: true,)));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text("ended")))),
      ),
    );
    
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.years.values.elementAt(2);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Mantash()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  "Монтаж ЗП (2021)",
                  style: TextStyle(fontSize: 16),
                )))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.years.values.elementAt(2);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RugNal()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  "Руж нал",
                  style: TextStyle(fontSize: 23),
                )))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.years.values.elementAt(2);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sber()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  "Сбер",
                  style: TextStyle(fontSize: 23),
                )))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.years.values.elementAt(2);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Alfa()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  "Альфа",
                  style: TextStyle(fontSize: 23),
                )))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.years.values.elementAt(2);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Podelili()));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200,
                child: Center(
                    child: Text(
                  "Поделили",
                  style: TextStyle(fontSize: 23),
                )))),
      ),
    );
    return yearButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Года"),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SizedBox(
            width: double.infinity,
            child: ListView(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Center(
                    child: Column(
                  children: kk(),
                )),
              )
            ])));
  }
}
