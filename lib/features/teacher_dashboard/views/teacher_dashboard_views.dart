import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/home/widgets/card_material.dart';
import 'package:zad_altalib/features/teacher_dashboard/views/teacher_dashboard_details_views.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/review_provider.dart';
import 'package:zad_altalib/shared/app_drawer.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class TeacherDashboardViews extends StatelessWidget {
  final UserModel currentUser;
  const TeacherDashboardViews({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final courseProvider = Provider.of<CourseProvider>(context, listen: true);
    final teacherCourses = courseProvider.coursesList.where((course) {
      return course.teacherId.trim() == currentUser.id.trim();
    }).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
                  ),

                  CustomText(
                    text: 'لوحة المعلم',
                    size: 19,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green.shade100,
                    backgroundImage: currentUser.image != null
                        ? AssetImage(currentUser.image!)
                        : AssetImage('assets/teacher_1.png'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Directionality(
        textDirection: TextDirection.rtl,
        child: AppDrawer(
          userName: 'Hello ${currentUser.name}',
          // ignore: unnecessary_string_interpolations
          image: '${currentUser.image ?? 'assets/teacher_1.png'}',
          userEmail: '${currentUser.name}@gmail.com',
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // text
          Padding(
            padding: const EdgeInsets.only(left: 340, right: 0.0, top: 20),
            child: CustomText(
              text: 'موادي',
              size: 19,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),

          Divider(),
          SizedBox(height: 10),
          // card
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final course = teacherCourses[index];
                      final review =
                          reviewProvider
                              .getCourseAverageRating(course.id)
                              .toStringAsFixed(1) ??
                          '0.0';
                      return GestureDetector(
                        child: CardMaterial(
                          image: course.image,
                          title: course.title,
                          description: course.description,
                          course: course,
                          rating: review,
                          icon: false,
                          sumPdf: course.pdfs.length,
                          sumYoutube: course.videos.length,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  TeacherDashboardDetailsViews(course: course),
                            ),
                          );
                        },
                      );
                    }, childCount: teacherCourses.length),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
