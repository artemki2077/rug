import 'package:flutter/material.dart';
import 'package:rug/globals.dart' as globals;
import 'home.dart';
import 'MontashZP/Montash_ZP.dart';
import 'RujNal/RujNal.dart';
import 'Banki/sber.dart';
import 'Banki/Alfa.dart';
import 'podelili.dart';

class Year extends StatefulWidget {
  const Year({Key? key}) : super(key: key);

  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // _showSnackbar(String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   _scaffoldKey.currentState!.showSnackBar(snackBar);
  // }

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
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            ended: false,
                          )));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200, child: Center(child: Text("Не ended")))),
      ),
    );
    yearButtons.add(
      Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ElevatedButton(
            onPressed: () {
              globals.year = globals.url21_22;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(
                            ended: true,
                          )));
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            child: const SizedBox(
                width: 200, child: Center(child: Text("ended")))),
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
                  "Монтаж ЗП (2022)",
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
                  "Руж нал(2022)",
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
                  context, MaterialPageRoute(builder: (context) => const Sber()));
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
                  context, MaterialPageRoute(builder: (context) => const Alfa()));
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
    if (globals.years.containsKey(2018)) {
      yearButtons = <Widget>[];
      yearButtons.add(
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () {
                // _showSnackbar("error");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('error'),
                    duration: Duration(seconds: 1),
                  ));
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
                    "2018",
                    style: TextStyle(fontSize: 23),
                  )))),
        ),
      );
      yearButtons.add(
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () {
                // _showSnackbar("error");
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('snack'),
                    duration: Duration(seconds: 1),
                  ));
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
                    "2007",
                    style: TextStyle(fontSize: 23),
                  )))),
        ),
      );
    }
    return yearButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
