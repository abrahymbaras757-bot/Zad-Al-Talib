import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/admin_dashboard/widgets/show_add_user_sheet.dart';
import 'package:zad_altalib/features/admin_dashboard/widgets/user_admin_card.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/search.dart';

// مكتمل
// صفحة إدارة المستخدمين
class UsersViews extends StatefulWidget {
  const UsersViews({super.key});

  @override
  State<UsersViews> createState() => _UsersViewsState();
}

class _UsersViewsState extends State<UsersViews> {
  // ignore: non_constant_identifier_names
  late TextEditingController SearchController = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    // تحديث قائمة المستخدمين المعروضة بناءً على البحث
    final users = userProvider.users.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: CustomText(
          text: 'إدارة المستخدمين',
          size: 19,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            child: Search(
              hintText: 'ابحث بالاسم',
              controller: SearchController,
              onChanged: (v) {
                setState(() {
                  query = v;
                });
              },
            ),
          ),
          // Card
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return UserAdminCard(
                  onEdit: () {
                    final nameController = TextEditingController(
                      text: user.name,
                    );

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("تعديل المستخدم"),
                          content: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: "الاسم",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: CustomText(
                                text: 'إلغاء',
                                size: 15,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                userProvider.updateUser(
                                  user.id,
                                  nameController.text,
                                );
                                Navigator.pop(context);
                              },
                              child: CustomText(
                                text: 'حفظ',
                                size: 15,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  // تفعيل و تعطيل المستخدم
                  onToggle: () {
                    userProvider.toggleUser(user.id);
                  },

                  // حذف المستخدم
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("تأكيد الحذف"),
                          content: Text("هل أنت متأكد من حذف ${user.name} ؟"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: CustomText(
                                text: 'إلغاء',
                                size: 15,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                userProvider.deleteUser(user.id);
                                Navigator.pop(context);
                              },
                              child: CustomText(
                                text: 'حذف',
                                size: 15,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  role: user.role,
                  name: user.name,
                  isActive: user.isActive,
                );
              },
            ),
          ),
        ],
      ),
      // اضافة مستخدم جديد
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserSheet(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
