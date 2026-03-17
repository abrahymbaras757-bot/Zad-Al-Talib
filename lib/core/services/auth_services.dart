import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/data/app_users.dart';

// هاذه الدالة تبحث داخل القائمة لو لقت المستخدم ترجع ال UserModel لو لا ترجع null
class AuthServices {
  static UserModel? login(String name, String password) {
    try {
      return appUsers.firstWhere(
        (user) => user.name == name && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }
}
