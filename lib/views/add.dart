import 'package:flutter/material.dart';
import 'package:rug/views/controller.dart';
import 'package:rug/views/model/form.dart';
import 'dart:math' as math;

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController timeController = TextEditingController();
  TextEditingController companiController = TextEditingController();
  TextEditingController nalController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController whoAndWhatController = TextEditingController();
  TextEditingController prixodController = TextEditingController();
  TextEditingController rasixodController = TextEditingController();
  TextEditingController ostatokController = TextEditingController();
  TextEditingController vidController = TextEditingController();
  TextEditingController podvidController = TextEditingController();
  TextEditingController ytochController = TextEditingController();
  TextEditingController inPerController = TextEditingController();
  TextEditingController sumDogovorController = TextEditingController();
  TextEditingController numDogovorController = TextEditingController();

  void _submitForm() {
      FeedbackForm feedbackForm = FeedbackForm(
          timeController.text,
          companiController.text,
          nalController.text,
          projectController.text,
          whoAndWhatController.text,
          prixodController.text,
          rasixodController.text,
          ostatokController.text,
          vidController.text,
          podvidController.text,
          ytochController.text,
          inPerController.text,
          sumDogovorController.text,
          numDogovorController.text);

      FormController formController = FormController((String response) {
        if (response == FormController.STATUS_SUCCESS) {
          //
          // _showSnackbar("отправилось усипешно");
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('отправилось усипешно'),
                    duration: const Duration(seconds: 1),
                  ));
        } else {
          // _showSnackbar("не отправилось");
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('не отправилось'),
                    duration: const Duration(seconds: 1),
                  ));
        }
      });
      formController.submitForm(feedbackForm);
  }

  // Method to show snackbar with 'message'.
  // _showSnackbar(String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   _scaffoldKey.currentState!.showSnackBar(snackBar);
  // }

  Widget form(String name, Icon icon, TextEditingController _controller) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: name,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            prefixIcon: icon,
          ),
          controller: _controller,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("добавить в таблицу"),
          elevation: 0,
        ),
        body: Center(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                child: Form(
                    key: _formKey,
                    child: ListView(
                  children: <Widget>[
                    form("дата(дд.мм.гггг)", const Icon(Icons.access_time), timeController),
                    form(
                        "компания", const Icon(Icons.account_box_rounded), companiController),
                    form("нал/безнал/другое",
                        const Icon(Icons.account_balance_wallet), nalController),
                    form(
                        "проект", const Icon(Icons.account_balance_sharp), projectController),
                    form("кто - что", const Icon(Icons.extension_rounded),
                        whoAndWhatController),
                    form("приход", const Icon(Icons.add), prixodController),
                    form("расход", const Icon(Icons.remove),
                        rasixodController),
                    form("остаток", const Icon(Icons.monetization_on), ostatokController),
                    form("вид расходов", const Icon(Icons.ballot), vidController),
                    form(
                        "подвид", const Icon(Icons.arrow_drop_down_circle), podvidController),
                    form("уточнения", const Icon(Icons.add_box_rounded), ytochController),
                    form("внутренняя переписка", const Icon(Icons.archive), inPerController),
                    form("сумма договора", const Icon(Icons.money), sumDogovorController),
                    form("номер договора", const Icon(Icons.format_list_numbered),
                        numDogovorController),
                    Transform.rotate(
                        angle: 1.5 * math.pi,
                        child: IconButton(
                            icon: const Icon(
                              Icons.arrow_drop_down_circle_rounded,
                            ),
                            iconSize: 65,
                            color: Colors.indigo,
                            tooltip: 'войти',
                            onPressed: _submitForm,))
                  ],
                )))));
  }
}
