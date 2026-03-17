import 'package:flutter/material.dart';
import 'package:zad_altalib/model/pdf_model.dart';
import 'package:zad_altalib/model/youtube_model.dart';
import '../model/course_model.dart';
import '../data/dummy_data.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> _courses = courses; // كل المواد
  List<CourseModel> _favoriteCourses = []; // المواد المفضلة

  // getter لكل المواد
  List<CourseModel> get coursesList => _courses;

  // getter للمفضلة
  List<CourseModel> get favoriteCourses => _favoriteCourses;

  // إضافة مادة جديدة
  void addCourse(CourseModel course) {
    _courses.add(course);
    notifyListeners();
  }

  // تعديل مادة
  void updateCourse(String id, String title, String desc, String image) {
    int index = _courses.indexWhere((e) => e.id == id);
    if (index != -1) {
      _courses[index].title = title;
      _courses[index].description = desc;
      _courses[index].image = image;
      notifyListeners();
    }
  }

  // إضافة أو إزالة مادة من المفضلة
  void toggleFavorite(CourseModel course) {
    if (_favoriteCourses.contains(course)) {
      _favoriteCourses.remove(course);
      course.isFavorite = false;
    } else {
      _favoriteCourses.add(course);
      course.isFavorite = true;
    }
    notifyListeners();
  }

  // ✅ حذف مادة
  void deleteCourse(String id) {
    coursesList.removeWhere((course) => course.id == id);
    notifyListeners();
  }

  // إضافة PDF لمادة معينة
  void addPdf(String courseId, String pdfTitle, String pdfPath) {
    final courseIndex = coursesList.indexWhere(
      (course) => course.id == courseId,
    );
    if (courseIndex != -1) {
      coursesList[courseIndex].pdfs.add(
        PdfModel(title: pdfTitle, filePath: pdfPath),
      );
      notifyListeners();
    }
  }

  // إضافة رابط YouTube لمادة معينة
  // ignore: non_constant_identifier_names
  void addYoutube(String courseId, String title, String Link) {
    final courseIndex = coursesList.indexWhere(
      (course) => course.id == courseId,
    );
    if (courseIndex != -1) {
      coursesList[courseIndex].videos.add(
        YoutubeModel(title: title, link: Link),
      );
      notifyListeners();
    }
  }

  CourseModel? getCourseById(String id) {
    return _courses.firstWhere((c) => c.id == id);
  }
}
