import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {'hello': 'Hello', 'login': 'Login'},

    'km_KH': {'hello': 'សួស្តី', 'login': 'ចូលប្រើ'},
  };
}
