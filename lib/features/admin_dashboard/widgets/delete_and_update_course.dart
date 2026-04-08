import 'package:zad_altalib/data/dummy_data.dart';

// دالة حذف المادة
void deleteCourse(String id) {
  courses.removeWhere((course) => course.id == id);
}

// دالة تعديل المادة
void updateCourseDirectly(
  String id,
  String newTitle,
  String newDesc,
  String newImage,
) {
  // هنا بحثنا على المادة المطلوبه باستخدام ال id
  int index = courses.indexWhere((e) => e.id == id);

  if (index != -1) {
    courses[index].title = newTitle;
    courses[index].description = newDesc;
    courses[index].image = newImage;
  }
}
