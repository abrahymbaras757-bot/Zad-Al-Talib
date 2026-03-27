import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/favorites/widgets/favorites_card.dart';
import 'package:zad_altalib/features/subject_content/views/subject_content_views.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/app_drawer.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class FavoritesViews extends StatelessWidget {
  const FavoritesViews({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context).currentUser;
    final favorites = context.watch<CourseProvider>().favoriteCourses;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,

        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 119.0),
            child: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 170.0),
            child: CustomText(
              text: 'المفضلة',
              size: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        // ignore: dead_null_aware_expression
        userName: userProvider?.name ?? 'المستخدم',
        image: userProvider?.image ?? 'assets/student_1.jpg',
        // ignore: dead_null_aware_expression
        userEmail: '${userProvider?.name ?? 'user'}@gmail.com',
      ),
      body: favorites.isEmpty
          ? Center(
              child: CustomText(
                text: 'لا توجد مواد مفضلة ',
                size: 18,
                color: Colors.grey,
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final course = favorites[index];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              SubjectContentViews(courseId: course.id),
                        ),
                      );
                    },
                    child: FavoritesCard(
                      title: course.title,
                      nameTeacher: course.teacherName,
                      sumpdf: course.pdfs.length,
                      sumyoutube: course.videos.length,
                      image: course.image,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
