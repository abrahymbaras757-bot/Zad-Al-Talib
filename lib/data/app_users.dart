import 'package:zad_altalib/model/user_model.dart';

List<UserModel> appUsers = [
  UserModel(
    id: '1',
    name: 'student1',
    image: 'assets/student.png',
    role: UserRole.student,
    password: '111',
    isActive: true,
  ),
  UserModel(
    id: '2',
    name: 'teacher1',
    image: 'assets/teacher.png',
    role: UserRole.teacher,
    password: '222',
    isActive: true,
  ),
  UserModel(
    id: '3',
    name: 'teacher2',
    image: 'assets/teacher.png',
    role: UserRole.teacher,
    password: '222',
    isActive: true,
  ),
  UserModel(
    id: '4',
    name: 'teacher3',
    image: 'assets/teacher.png',
    role: UserRole.teacher,
    password: '222',
    isActive: true,
  ),
  UserModel(
    id: '5',
    image: 'assets/admin.jpg',
    name: 'admin',
    role: UserRole.admin,
    password: '333',
    isActive: true,
  ),
];
