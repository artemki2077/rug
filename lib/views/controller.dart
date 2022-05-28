import 'dart:convert' as convert;
import 'package:rug/views/model/form.dart';
import 'package:http/http.dart' as http;
import 'package:rug/globals.dart' as glob;

class FormController {
  final void Function(String) callback;
  var indf = glob.addings[glob.years.keys.elementAt(glob.y)];
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    print(feedbackForm.toParams());
    print(glob.y);
    var url = Uri.https("script.google.com", indf, feedbackForm.toParams());
    try {
      await http.get(url, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      }).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback("error");
    }
  }
}
