import 'package:flutter/material.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.count,
    required this.onTap,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String description;
  final int count;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: theme.colorScheme.outline,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: theme.colorScheme.onSurface.withAlpha(60),
              blurRadius: 2,
              //offset: Offset(1, 1),
              spreadRadius: 2,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              width: 70,
              height: 70,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 30,
                child: Icon(icon, color: color, size: 28),
              ),
            ),
            SizedBox(height: 20),

            CustomText(
              text: title,
              size: 20,
              color: theme.colorScheme.onSurface,
            ),

            SizedBox(height: 6),

            CustomText(text: description, size: 14, color: Colors.grey[600]),

            Spacer(),

            Center(
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomText(text: '$count', size: 26, color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
