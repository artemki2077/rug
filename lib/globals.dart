library rug.globals;

import 'urls.dart' as secrets;

Map years = {
  2020: Uri.https("script.google.com", secrets.url2020),
  2021: Uri.https("script.google.com", secrets.url2021),
  2022: Uri.https("script.google.com", secrets.url2022),
};
Map addings = {2021: secrets.add2021, 2022: secrets.add2022};
int y = 0;
List ff = [];
List<String> h = [];
late String vid;
List<String> p = <String>[
  "Монтаж ЗП",
  'Конструкция покраска/оцинковка',
  "Конструкция Изготовление в мастерской ЗП",
  "Монтаж ЗП ",
];
List<String> H = <String>[
  "Коваль Монтаж ЗП ",
  "Коваль",
];
List<String> hhh = <String>[
  'сбер - карточка',
  'поделили',
  'поделили ЗП',
  'сбер - Альфа',
  'остаток 21',
  "Коваль ипотека",
  "ВТБ - СБЕР",
  "остаток",
  "возврат",
  'нал - сбер',
  'сбер - нал',
  'Безнал - карточка',
  'ИП',
  'ИП %',
  'под отчет',
  'ошибочный платеж',
  'втб - сбер',
  'нал - безнал',
  'безнал-нал',
  "оплачено",
  "спецсчёт",
];
List<String> hhhh = <String>["фирма", "поделили", "катер", "мастерская"];
late Uri year;
late Uri url21_22 = Uri.https("script.google.com", secrets.url21_22);
Map pp = {};
late int n;
