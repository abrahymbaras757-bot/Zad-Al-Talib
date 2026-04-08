import 'package:flutter/material.dart';
import 'package:zad_altalib/model/review_model.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class ReviewAdminCard extends StatelessWidget {
  final String userName;
  final String courseName;
  final String comment;
  final double rating;
  final ReviewModel review;
  final VoidCallback onDelete;
  final VoidCallback onToggle;
  const ReviewAdminCard({
    super.key,
    required this.review,
    required this.onDelete,
    required this.onToggle,
    required this.userName,
    required this.courseName,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      color: theme.colorScheme.outline,
      shadowColor: Colors.blue,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اسم المستخدم
            CustomText(text: userName, size: 18, weight: FontWeight.bold),
            SizedBox(height: 4),
            // اسم المادة
            CustomText(text: courseName, size: 16, color: Colors.grey),
            // النجوم
            Row(
              children: List.generate(
                rating.floor().toInt(),
                (index) => Icon(Icons.star, color: Colors.amber, size: 20),
              ),
            ),
            SizedBox(height: 10),
            // التعليق
            CustomText(
              text: comment,
              size: 15,
              color: theme.colorScheme.onSurface,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                // حالة التقييم
                Chip(
                  label: CustomText(
                    text: review.isApproved ? 'معتمد' : 'مخفي',
                    size: 16,
                    color: Colors.black,
                  ),
                  backgroundColor: review.isApproved
                      ? Colors.green.shade300
                      : Colors.grey.shade100,
                ),
                Spacer(),
                // زر الاخفاء
                IconButton(
                  onPressed: onToggle,
                  icon: Icon(
                    review.isApproved ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                // زر الحذف
                IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
