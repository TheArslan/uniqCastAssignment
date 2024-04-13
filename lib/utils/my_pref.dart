import 'package:get_storage/get_storage.dart';
import 'package:uniqcastassignment/models/data_models/user.dart';
import 'package:uniqcastassignment/utils/constants/my_prefrences_constants.dart';

class MyPref {
  static final _storage = GetStorage();

  MyPref._();

  static void updateUserInfo({User? user}) {
    if (user != null) {
      _storage.write(
        MyPreferencesConstants.currentUser,
        user.toJson(),
      );
    }
  }

  static User? getCurrentUser() {
    final savedValue = _storage.read(MyPreferencesConstants.currentUser);
    if (savedValue != null) {
      return User.fromJson(savedValue);
    }
    return null;
  }

  static void logOutUser() {
    _storage.erase();
  }
}
