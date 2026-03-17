import 'package:zad_altalib/model/course_model.dart';

// كلاس المعلمين
class TeacherModel {
  final String name;
  final String? image;
  final List<CourseModel> courses;
  TeacherModel({required this.name, this.image, required this.courses});
}
