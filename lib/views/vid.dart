import 'package:flutter/material.dart';
import 'package:rug/globals.dart' as globals;

var form = globals.form;

class vids extends StatefulWidget {
  @override
  _vidsState createState() => _vidsState();
}

class _vidsState extends State<vids> {
  List<int> pp = [];

  kkk() {
    int nn = 0;
    for (var n in globals.ff) {
      if (n.project == globals.h.elementAt(globals.n) && n.vid == globals.vid) {
        pp.add(nn);
      }
      nn += 1;
    }
  }

  String num(int n) {
    var i = 1;
    var result = "";
    while (i * 3 <= n.toString().length) {
      result = (" " +
              n.toString().substring(n.toString().length - (3 * i),
                  n.toString().length - (3 * (i - 1)))) +
          result;
      i += 1;
    }
    return n.toString().substring(0, n.toString().length % 3) + result;
  }

  @override
  void initState() {
    kkk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${globals.h.elementAt(globals.n)} - ${globals.vid}"),
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
          SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: 70,
                      columnSpacing: 30,
                      columns: <DataColumn>[
                        DataColumn(label: Text(globals.text_form), numeric: true),
                        const DataColumn(label: Text("приход"), numeric: true),
                        const DataColumn(label: Text('расход'), numeric: true),
                        const DataColumn(label: Text("кто - что")),
                        const DataColumn(label: Text("компания")),
                        const DataColumn(label: Text("нал/без")),
                        const DataColumn(label: Text("проект")),
                        const DataColumn(label: Text("остаток"), numeric: true),
                        const DataColumn(label: Text("вид расхода")),
                        const DataColumn(label: Text('подвид')),
                        const DataColumn(label: Text("уточнения")),
                        const DataColumn(label: Text("внутренняя переписка")),
                        const DataColumn(
                            label: Text("сумма договора"), numeric: true),
                        const DataColumn(
                            label: Text("номер договора"), numeric: true),
                      ],
                      rows: List<DataRow>.generate(
                        pp.length,
                        (int index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(form.format(DateTime.parse(
                                globals.ff.elementAt(pp.elementAt(index)).time.toString())))),
                            DataCell(Text(globals.ff
                                        .elementAt(pp.elementAt(index))
                                        .prixod !=
                                    ""
                                ? num(globals.ff
                                    .elementAt(pp.elementAt(index))
                                    .prixod
                                    .toInt())
                                : "")),
                            DataCell(Text(globals.ff
                                        .elementAt(pp.elementAt(index))
                                        .rasixod !=
                                    ""
                                ? num(globals.ff
                                    .elementAt(pp.elementAt(index))
                                    .rasixod
                                    .toInt())
                                : "")),
                            DataCell(Container(
                                width: 120,
                                child: Text(
                                  "${globals.ff.elementAt(pp.elementAt(index)).whoAndWhat}",
                                  softWrap: true,
                                ))),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).compani}")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).nal}")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).project}")),
                            DataCell(Text(globals.ff
                                        .elementAt(pp.elementAt(index))
                                        .ostatok !=
                                    ""
                                ? num(globals.ff
                                    .elementAt(pp.elementAt(index))
                                    .ostatok
                                    .toInt())
                                : "")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).vid}")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).podvid}")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).ytoch}")),
                            DataCell(Text(
                                "${globals.ff.elementAt(pp.elementAt(index)).inPer}")),
                            DataCell(Text(globals.ff
                                        .elementAt(pp.elementAt(index))
                                        .sumDogovor !=
                                    ""
                                ? num(globals.ff
                                    .elementAt(pp.elementAt(index))
                                    .sumDogovor
                                    .toInt())
                                : "")),
                            DataCell(Text(globals.ff
                                        .elementAt(pp.elementAt(index))
                                        .numDogovor !=
                                    ""
                                ? num(globals.ff
                                    .elementAt(pp.elementAt(index))
                                    .numDogovor
                                    .toInt())
                                : "")),
                          ],
                        ),
                      ),
                    ),
                  ))),
        ]));
  }
}
