// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get error => 'Произошла ошибка';

  @override
  String get question => 'Вопрос';

  @override
  String get quiz => 'Викторина';

  @override
  String get python => 'Python';

  @override
  String get java => 'Java';

  @override
  String get javaScript => 'JavaScript';

  @override
  String get dart => 'Dart';

  @override
  String get selectLanguage => 'Выберите язык программирования';

  @override
  String get selectLevel => 'Выберите ваш уровень';

  @override
  String get levelJunior => 'Junior';

  @override
  String get levelMiddle => 'Middle';

  @override
  String get levelSenior => 'Senior';

  @override
  String get infoDart => 'Dart — современный и быстрый язык программирования для разработки на Flutter.';

  @override
  String get infoJava => 'Java — один из самых популярных языков программирования в мире.';

  @override
  String get infoJavaScript => 'JavaScript — интерактивный язык программирования для веба.';

  @override
  String get infoPython => 'Python широко используется для анализа данных, искусственного интеллекта и робототехники.';

  @override
  String get resultPage => 'Посмотреть результаты';

  @override
  String get correct => 'Правильно';

  @override
  String get wrong => 'Неправильно';

  @override
  String get result => 'Ваш результат';

  @override
  String get info => 'Читать подробнее';

  @override
  String get withAi => 'Вопросы, сгенерированные ИИ';

  @override
  String get networkError => 'Похоже, у вас нет подключения к интернету, пожалуйста, проверьте сеть.';

  @override
  String get reload => 'Проверить подключение к интернету';
}
