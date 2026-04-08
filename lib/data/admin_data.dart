import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/admin_dashboard/views/courses_views.dart';
import 'package:zad_altalib/features/admin_dashboard/views/review_views.dart';
import 'package:zad_altalib/features/admin_dashboard/views/users_views.dart';
import 'package:zad_altalib/model/models_admin.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/review_provider.dart';
import 'package:zad_altalib/providers/user_provider.dart';

List<ModelsAdmin> getAdminData(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final courseProvider = Provider.of<CourseProvider>(context);
  final reviewProvider = Provider.of<ReviewProvider>(context);

  return [
    ModelsAdmin(
      icon: Icons.people_alt,
      title: 'المستخدمين',
      description: 'إدارة حسابات الطلاب والمعلمين',
      count: userProvider.users.length, // هنا العدد من Provider
      page: UsersViews(),
    ),
    ModelsAdmin(
      icon: Icons.menu_book_sharp,
      title: 'المواد',
      description: 'إنشاء وتعديل وحذف المواد التعليمية',
      count: courseProvider.coursesList.length, // العدد من Provider
      page: CoursesViews(),
    ),
    ModelsAdmin(
      icon: Icons.rate_review,
      title: 'المراجعة',
      description: 'متابعة التقييمات والملاحظات',
      count: reviewProvider.reviews.length,
      page: ReviewViews(),
    ),
  ];
}
