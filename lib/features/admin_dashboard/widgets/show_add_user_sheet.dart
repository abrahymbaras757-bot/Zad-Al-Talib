import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/data/app_users.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';

void showAddUserSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final pasController = TextEditingController();

  UserRole? selectedRole;

  // فتح النافذة من اسفل الواجهة
  showModalBottomSheet(
    context: context,
    // تحرك النافذه عند استخدام لوحة المفاتيح
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20,
              right: 20,
              top: 25,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: 'إضافة مستخدم خديد',
                    size: 20,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(height: 20),

                  // الاسم
                  CustomTextField(
                    hint: 'اسم المستخدم',
                    ispassword: false,
                    controller: nameController,
                    sideColor: Theme.of(context).colorScheme.tertiary,
                    hintColor: Theme.of(context).colorScheme.onSurface,
                    textColor: Theme.of(context).colorScheme.onSurface,
                  ),
                  SizedBox(height: 7),
                  // كلمة المرور
                  CustomTextField(
                    hint: 'كلمة المرور',
                    ispassword: true,
                    controller: pasController,
                    sideColor: Theme.of(context).colorScheme.tertiary,
                    hintColor: Theme.of(context).colorScheme.onSurface,
                    textColor: Theme.of(context).colorScheme.onSurface,
                    iconColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  SizedBox(height: 4),
                  // اختيار الدور
                  DropdownButtonFormField<UserRole>(
                    decoration: InputDecoration(
                      labelText: 'نوع المستخدم',
                      border: OutlineInputBorder(),
                    ),
                    // ignore: deprecated_member_use
                    value: selectedRole,
                    items: UserRole.values.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: CustomText(text: role.name, size: 17),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedRole = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'اختر نوع المستخدم';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),

                  // زر الحفظ
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      color: Theme.of(context).colorScheme.tertiary,
                      text: 'حفظ المستخدم',
                      onTap: () {
                        // التحقق هل حقول الفورم فارغة باستخدام المفتاح formkey
                        if (formKey.currentState!.validate()) {
                          final newUser = UserModel(
                            id: (appUsers.length + 1).toString(),
                            name: nameController.text,
                            role: selectedRole!,
                            password: pasController.text,
                            isActive: true,
                            image: selectedRole == UserRole.teacher
                                ? 'assets/teacher_1.png'
                                : 'assets/student_1.png',
                          );

                          Provider.of<UserProvider>(
                            context,
                            listen: false,
                          ).addUser(newUser);

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: CustomText(
                                text: 'تم إضافة المستخدم بنجاح',
                                size: 18,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
