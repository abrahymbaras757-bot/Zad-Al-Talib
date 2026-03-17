import 'package:flutter/material.dart';
import 'package:zad_altalib/data/app_users.dart';
import 'package:zad_altalib/model/user_model.dart';

class UserProvider with ChangeNotifier {
  final List<UserModel> _users = appUsers;

  List<UserModel> get users => _users;

  // بيانات تسجيل الدخول
  UserModel? currentUser;
  void login(UserModel user) {
    currentUser = user;
    notifyListeners();
  }

  void logout() {
    currentUser = null;
    notifyListeners();
  }

  // إضافة مستخدم
  void addUser(UserModel user) {
    _users.add(user);
    notifyListeners();
  }

  // حذف مستخدم
  void deleteUser(String id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }

  // تبديل حالة المستخدم
  void toggleUser(String id) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      _users[index] = _users[index].copyWith(isActive: !_users[index].isActive);
      notifyListeners();
    }
  }

  // تعديل المستخدم
  void updateUser(String id, String name) {
    final index = _users.indexWhere((u) => u.id == id);
    if (index != -1) {
      _users[index] = _users[index].copyWith(name: name);
      notifyListeners();
    }
  }
}
