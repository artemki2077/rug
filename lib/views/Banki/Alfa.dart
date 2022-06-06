import 'package:flutter/material.dart';
import 'package:rug/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:rug/feedback_model.dart';
import 'dart:convert' as convert;

var form = globals.form;

class Alfa extends StatefulWidget {
  const Alfa({Key? key}) : super(key: key);

  @override
  _AlfaState createState() => _AlfaState();
}

class _AlfaState extends State<Alfa> {
  var fo = [];
  bool bf = true;
  double SumPrixod = 0;
  double SumRasixod = 0;
  double ostatok = 0;
  bool bError = false;
  String sError = "";
  List<FeedbackModel> feedbacks = <FeedbackModel>[];

  String toNum(int n) {
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

  getFeedbackFromSheet() {
    http.get(globals.year).then((raw) {
      var jsonFeedback = convert.jsonDecode(raw.body);
      jsonFeedback.forEach((element) {
        if (element["дата"] != "") {
          FeedbackModel feedbackModel = FeedbackModel();
          if (element['компания'] == "Альфа" &&
              element['нал/безнал/другое'] == 'безнал') {
            feedbackModel.time = DateTime.parse(element['дата']);
            feedbackModel.compani = element['компания'];
            feedbackModel.nal = element['нал/безнал/другое'];
            feedbackModel.project = element['проект'];
            feedbackModel.whoAndWhat = element['кто - что'];
            feedbackModel.prixod = element['приход'];
            feedbackModel.rasixod = element['расход'];
            if (element['расход'] != "") {
              SumRasixod += element['расход'];
            }
            if (element['приход'] != "") {
              SumPrixod += element['приход'];
            }
            feedbackModel.ostatok = element['остаток'];
            feedbackModel.vid = element['вид расходов'];
            feedbackModel.podvid = element['подвид'];
            feedbackModel.ytoch = element['уточнения'];
            feedbackModel.inPer = element['внутренняя переписка'];
            feedbackModel.sumDogovor = element['сумма договора'];
            feedbackModel.numDogovor = element['номер договора'];
            feedbacks.add(feedbackModel);
            globals.ff.add(feedbackModel);
          }
        }
      });

      setState(() {
        globals.ff
            .sort(((a, b) => a.time.toString().compareTo(b.time.toString())));
        globals.ff = globals.ff.reversed.toList();
      });
    });
  }

  @override
  void initState() {
    globals.h = [];
    globals.ff = [];
    getFeedbackFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: 100,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "приход: ${toNum(SumPrixod.toInt())}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "расход: ${toNum(SumRasixod.toInt())}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                "остаток: ${toNum((SumPrixod - SumRasixod).toInt())}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: globals.ff.isNotEmpty
            ? SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 10,
                          columns: <DataColumn>[
                            DataColumn(label: Text(globals.text_form)),
                            const DataColumn(label: Text('проект')),
                            const DataColumn(
                              label: Text("приход"),
                              numeric: true,
                            ),
                            const DataColumn(label: Text("расход"), numeric: true),
                            const DataColumn(label: Text('кто - что')),
                            const DataColumn(label: Text("остаток"), numeric: true),
                          ],
                          rows: List<DataRow>.generate(
                            globals.ff.length,
                            (int i) => DataRow(
                              cells: <DataCell>[
                                DataCell(Text(
                                    form.format(globals.ff.elementAt(i).time),
                                    softWrap: false)),
                                DataCell(SizedBox(
                                    width: 90,
                                    child: Text(
                                        "${globals.ff.elementAt(i).project}",
                                        softWrap: false))),
                                DataCell(Text(globals.ff.elementAt(i).prixod !=
                                        ""
                                    ? toNum(
                                        globals.ff.elementAt(i).prixod.toInt())
                                    : "")),
                                DataCell(Text(globals.ff.elementAt(i).rasixod !=
                                        ""
                                    ? toNum(
                                        globals.ff.elementAt(i).rasixod.toInt())
                                    : "")),
                                DataCell(SizedBox(
                                    width: 80,
                                    child: Text(
                                        "${globals.ff.elementAt(i).whoAndWhat}",
                                        softWrap: true))),
                                DataCell(Text(toNum(
                                    globals.ff.elementAt(i).ostatok.toInt()))),
                              ],
                            ),
                          ),
                        ))))
            : !bError
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                      strokeWidth: 5,
                    ),
                  )
                : Center(
                    child: Text(sError),
                  ));
  }
}
