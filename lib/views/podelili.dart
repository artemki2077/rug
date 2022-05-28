import 'package:flutter/material.dart';
import 'package:rug/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:rug/feedback_model.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

var form = DateFormat('MM/dd');

class Podelili extends StatefulWidget {
  @override
  _PodeliliState createState() => _PodeliliState();
}

class _PodeliliState extends State<Podelili> {
  var fo = [];
  bool bf = true;
  double SumPrixod = 0;
  double SumRasixod = 0;
  double rugPod = 0;
  double rugPodZp = 0;
  double osPod = 0;
  double osPodZp = 0;
  double rugPodR = 0;
  double rugPodZpR = 0;
  double osPodR = 0;
  double osPodZpR = 0;
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
          if (element['компания'] == 'Руж') {
            if (element['расход'] != "") {
              SumRasixod += element['расход'];
            }
            if (element['приход'] != "") {
              SumPrixod += element['приход'];
            }
          }
          if (element['проект'] == "поделили" ||
              element['проект'] == 'поделили ЗП') {
            feedbackModel.time = DateTime.parse(element['дата']);
            feedbackModel.compani = element['компания'];
            feedbackModel.nal = element['нал/безнал/другое'];
            feedbackModel.project = element['проект'];
            feedbackModel.whoAndWhat = element['кто - что'];
            feedbackModel.prixod = element['приход'];
            feedbackModel.rasixod = element['расход'];
            if (element['расход'] != "") {
              if (element['вид расходов'] == 'Руж') {
                if (element['проект'] == "поделили") {
                  rugPodR += element['расход'];
                } else {
                  rugPodZpR += element['расход'];
                }
              } else {
                if (element['проект'] == "поделили") {
                  osPodR += element['расход'];
                } else {
                  osPodZpR += element['расход'];
                }
              }
            }
            if (element['приход'] != "") {
              if (element['вид расходов'] == 'Руж') {
                if (element['проект'] == "поделили") {
                  rugPod += element['приход'];
                } else {
                  rugPodZp += element['приход'];
                }
              } else {
                if (element['проект'] == "поделили") {
                  osPod += element['приход'];
                } else {
                  osPodZp += element['приход'];
                }
              }
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
          backgroundColor: Colors.amber[800],
          toolbarHeight: 120,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "поделили: ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "пооделили ЗП:",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Итог: ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Ос",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum(osPodR.toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum(osPodZpR.toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum((osPodR + osPodZpR).toInt()),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Руж",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum(rugPodR.toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum(rugPodZpR.toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum((rugPodR + rugPodZpR).toInt()),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Разница",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum((osPodR - rugPodR).toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum((osPodZpR - rugPodZpR).toInt()),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        toNum(((osPodR - rugPodR) + (osPodZpR - rugPodZpR))
                            .toInt()),
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Руж нал: ${toNum((SumPrixod - SumRasixod).toInt())}      ",
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    "Итог: ${toNum(((SumPrixod - SumRasixod) + (osPodR - rugPodR) + (osPodZpR - rugPodZpR)).toInt())}",
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
        body: globals.ff.isNotEmpty
            ? ListView(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: 10,
                                columns: const <DataColumn>[
                                  DataColumn(label: Text('дата')),
                                  DataColumn(label: Text('проект')),
                                  DataColumn(
                                    label: Text("приход"),
                                    numeric: true,
                                  ),
                                  DataColumn(
                                      label: Text("расход"), numeric: true),
                                  DataColumn(label: Text('кто - что')),
                                  DataColumn(
                                      label: Text("вид расхода"), numeric: true),
                                ],
                                rows: List<DataRow>.generate(
                                  globals.ff.length,
                                  (int i) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(SizedBox(
                                          width: 40,
                                          child: Text(
                                              form.format(
                                                  globals.ff.elementAt(i).time),
                                              softWrap: true))),
                                      DataCell(SizedBox(
                                          width: 90,
                                          child: Text(
                                              "${globals.ff.elementAt(i).project}",
                                              softWrap: true))),
                                      DataCell(Text(
                                          globals.ff.elementAt(i).prixod != ""
                                              ? toNum(globals.ff
                                                  .elementAt(i)
                                                  .prixod
                                                  .toInt())
                                              : "")),
                                      DataCell(Text(
                                          globals.ff.elementAt(i).rasixod != ""
                                              ? toNum(globals.ff
                                                  .elementAt(i)
                                                  .rasixod
                                                  .toInt())
                                              : "")),
                                      DataCell(SizedBox(
                                          width: 80,
                                          child: Text(
                                              "${globals.ff.elementAt(i).whoAndWhat}",
                                              softWrap: true))),
                                      DataCell(Text(globals.ff
                                          .elementAt(i)
                                          .vid)),
                                    ],
                                  ),
                                ),
                              )))),
                ],
              )
            : !bError
                ? const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
                      strokeWidth: 5,
                    ),
                  )
                : Center(
                    child: Container(child: Text(sError)),
                  ));
  }
}
