import 'package:hive/hive.dart';

class CacheHelper {
  static saveToken({required String stringToken}) async {
    var box = await Hive.openBox('tokenBox');
    box.put('token', stringToken);
  }

  static getToken() async {
    var box = await Hive.openBox('tokenBox');
    box.get('token');
  }

  static deleteToken() async {
    var box = await Hive.openBox('tokenBox');
    box.delete('token');
  }
}
