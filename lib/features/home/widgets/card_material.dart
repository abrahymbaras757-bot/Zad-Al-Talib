import 'package:flutter/material.dart';
import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class CardMaterial extends StatelessWidget {
  const CardMaterial({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.nameTeacher,
    this.onPressed,
    required this.course,
    this.icon = true,
    this.sumPdf,
    this.sumYoutube,
    required this.rating,
  });

  final CourseModel course;
  final String image;
  final String title;
  final String description;
  final String? nameTeacher;
  final String rating;
  final Function()? onPressed;
  final bool icon;
  final int? sumPdf;
  final int? sumYoutube;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2,
      shadowColor: Colors.blue,
      color: theme.colorScheme.outline,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ⭐ Favorite icon
            if (icon)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    course.isFavorite ? Icons.star : Icons.star_border,
                    size: 28,
                  ),
                  color: theme.colorScheme.tertiary,
                ),
              ),

            ///  Course image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            ///  Title
            CustomText(
              text: title,
              size: 18,
              weight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),

            const SizedBox(height: 4),

            ///  Description
            CustomText(
              text: description,
              size: 14,
              color: theme.textTheme.bodyMedium?.color,
            ),

            const SizedBox(height: 6),

            // Rating
            Row(
              children: [
                ///  Teacher name
                if (nameTeacher != null)
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 16,
                        color: theme.colorScheme.tertiary,
                      ),
                      const SizedBox(width: 4),
                      CustomText(
                        text: nameTeacher!,
                        size: 13,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ],
                  ),
                SizedBox(width: nameTeacher != null ? 61 : 110),
                Icon(Icons.star, size: 16, color: Colors.amber),
                CustomText(
                  text: rating ?? '0.0',
                  size: 15,
                  color: theme.textTheme.bodyMedium?.color,
                ),
              ],
            ),

            const Spacer(),

            ///  PDF & YouTube
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _contentBox(context, Icons.description, "${sumPdf ?? 0} PDF"),

                _contentBox(
                  context,
                  Icons.ondemand_video_outlined,
                  "${sumYoutube ?? 0} فيديو",
                ),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget _contentBox(BuildContext context, IconData icon, String text) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.tertiary.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.tertiary),
          const SizedBox(width: 4),
          CustomText(text: text, size: 13, color: theme.colorScheme.onSurface),
        ],
      ),
    );
  }
}
