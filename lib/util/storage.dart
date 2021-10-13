import 'package:get_storage/get_storage.dart';

class Storage {
  static final box = GetStorage();

  bool getLoginValue() {
    if(box.read('login') == null || box.read('login') == false) {
      return false;
    }

    return true;
  }

  Future<void> setLoginValue() async {
    await box.write('login', true);
  }

  String getUid() {
    return box.read('uid');
  }

  Future<void> setUid(String uid) async {
    return box.write('uid', uid);
  }
}