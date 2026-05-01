import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/admin_dashboard/widgets/review_admin_card.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/review_provider.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/search.dart';

// صفحة إدارة المراجعة
class ReviewViews extends StatelessWidget {
  ReviewViews({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final courseProvider = Provider.of<CourseProvider>(context);
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final theme = Theme.of(context);
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: theme.colorScheme.surface,
            appBar: AppBar(
              foregroundColor: theme.colorScheme.inversePrimary,
              backgroundColor: theme.colorScheme.primary,
              title: CustomText(
                text: 'إدارة التقييمات و المراجعة',
                size: 19,
                color: theme.colorScheme.inversePrimary,
              ),
              centerTitle: true,
            ),

            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: _stateCard(
                          'عدد التقييمات',
                          reviewProvider.reviews.length.toString(),
                          Icons.rate_review,
                          Colors.blue,
                          context,
                        ),
                      ),
                      Expanded(
                        child: _stateCard(
                          'متوسط التقييمات',
                          reviewProvider
                              .getCourseAverageRating(
                                reviewProvider.reviews.first.courseId,
                              )
                              .toStringAsFixed(1),
                          Icons.star,
                          Colors.blue,
                          context,
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     left: 10,
                //     right: 10,
                //     top: 10,
                //     bottom: 10,
                //   ),
                //   child: Search(
                //     hintText: 'ابحث بالاسم',
                //     controller: searchController,
                //     onTap: () {},
                //     onChanged: (p0) {},
                //   ),
                // ),
                SizedBox(height: 20),

                // قائمة التقييمات
                Expanded(
                  child: ListView.builder(
                    itemCount: reviewProvider.reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviewProvider.reviews[index];
                      final user = userProvider.users.firstWhere(
                        (u) => u.id == review.userId,
                      );
                      final course = courseProvider.coursesList.firstWhere(
                        (c) => c.id == review.courseId,
                      );
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: ReviewAdminCard(
                          review: review,
                          comment: review.comment,
                          courseName: course.title,
                          userName: user.name,
                          rating: review.rating.toDouble(),
                          onDelete: () {
                            reviewProvider.deleteReview(review.id);
                          },
                          onToggle: () {
                            reviewProvider.toggleReview(review.id);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _stateCard(
  String title,
  String value,
  IconData icon,
  Color color,
  BuildContext context,
) {
  final theme = Theme.of(context);
  return Card(
    color: theme.colorScheme.outline,
    elevation: 1.5,
    shadowColor: Colors.blue,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          SizedBox(width: 4.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: title, size: 16),
              CustomText(text: value, size: 20, weight: FontWeight.bold),
            ],
          ),
        ],
      ),
    ),
  );
}
