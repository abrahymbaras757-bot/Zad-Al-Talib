import 'package:flutter/material.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/shared/custom_text.dart';

class UserAdminCard extends StatelessWidget {
  const UserAdminCard({
    super.key,
    required this.onEdit,
    required this.onToggle,
    required this.onDelete,
    required this.role,
    required this.name,
    required this.isActive,
  });

  final String name;
  final VoidCallback onEdit;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  final UserRole role;
  final bool isActive;

  String roleToArabic(UserRole role) {
    switch (role) {
      case UserRole.student:
        return 'طالب';
      case UserRole.teacher:
        return 'معلم';
      case UserRole.admin:
        return 'مسؤول';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.outline,
      shadowColor: Theme.of(context).colorScheme.onSurface.withAlpha(65),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green.shade100,
                  child: Icon(
                    role == UserRole.student
                        ? Icons.school
                        : role == UserRole.teacher
                        ? Icons.person
                        : Icons.admin_panel_settings,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: name, size: 18),
                      CustomText(text: roleToArabic(role), size: 16),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).colorScheme.tertiary
                        : Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomText(
                    text: isActive ? 'نشط' : 'معطل',
                    size: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  label: const Text(
                    'تعديل',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton.icon(
                  onPressed: onToggle,
                  icon: Icon(
                    isActive ? Icons.block : Icons.check_circle,
                    color: Colors.orange,
                  ),
                  label: Text(
                    isActive ? 'تعطيل' : 'تفعيل',
                    style: const TextStyle(color: Colors.orange),
                  ),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text('حذف', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
