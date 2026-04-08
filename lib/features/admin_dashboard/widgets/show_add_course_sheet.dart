import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';

// دالة إضافة مادة جديدة في صفحة لوحة التحكم
// ignore: unused_element

void showAddCourseSheet(
  BuildContext context,
  List<UserModel> availableTeachers,
) {
  // ignore: no_leading_underscores_for_local_identifiers
  final _formkey = GlobalKey<FormState>();
  //
  // ignore: no_leading_underscores_for_local_identifiers
  final TextEditingController _titleController = TextEditingController();
  //
  // ignore: no_leading_underscores_for_local_identifiers
  final TextEditingController _descController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      UserModel? selectedTeacher;
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),

            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ========= عنوان الشيت =======
                    Center(
                      child: CustomText(
                        text: 'إنشاء مادة جديدة',
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 20),

                    // ======== حقل العنوان ========
                    CustomTextField(
                      hint: 'عنوان المادة',
                      ispassword: false,
                      controller: _titleController,
                      hintColor: Theme.of(context).colorScheme.onSurface,
                      sideColor: Theme.of(context).colorScheme.tertiary,
                      textColor: Theme.of(context).colorScheme.onSurface,
                    ),

                    SizedBox(height: 15),

                    // ========= حقل الوصف ========
                    CustomTextField(
                      hint: 'وصف المادة',
                      ispassword: false,
                      controller: _descController,
                      maxLines: 3,
                      hintColor: Theme.of(context).colorScheme.onSurface,
                      sideColor: Theme.of(context).colorScheme.tertiary,
                      textColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    SizedBox(height: 15),

                    // ========= دروب المعلمين ========
                    DropdownButtonFormField<UserModel>(
                      decoration: InputDecoration(
                        labelText: 'اختر المعلم',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        focusColor: Theme.of(context).colorScheme.onSurface,
                        hoverColor: Theme.of(context).colorScheme.onSurface,
                      ),
                      // ignore: deprecated_member_use
                      value: selectedTeacher,
                      items: availableTeachers.map((teacher) {
                        return DropdownMenuItem<UserModel>(
                          value: teacher,
                          child: CustomText(text: teacher.name, size: 16),
                        );
                      }).toList(),
                      validator: (value) {
                        // اذا القيمة فارغة اظهر الرسالة
                        if (value == null) {
                          return 'يرجى اخنيار معلم';
                        }
                        // ignore: avoid_returning_null_for_void
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedTeacher = value;
                        });
                      },
                    ),
                    SizedBox(height: 25),

                    // ============== زر الحفظ ===============
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        color: Theme.of(context).colorScheme.tertiary,
                        text: 'إنشاء المادة',
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            // ignore: unnecessary_null_comparison
                            // اذا لم يتم اختيار معلم اظهر رسالة الخطا
                            if (selectedTeacher == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: CustomText(
                                    text: 'يرجى اختيار معلم أولاً',
                                    size: 17,
                                  ),
                                ),
                              );
                              return;
                            }
                            final newCourse = CourseModel(
                              pdfs: [],
                              videos: [],
                              title: _titleController.text,
                              description: _descController.text,
                              image: 'assets/teacher_1.png',
                              // ignore: unnecessary_non_null_assertion
                              teacherId: selectedTeacher!.id,
                              // ignore: unnecessary_non_null_assertion
                              id: DateTime.now().millisecondsSinceEpoch
                                  .toString(),
                              // ignore: unnecessary_non_null_assertion
                              teacherName: selectedTeacher!.name,
                              isFavorite: false,
                            );
                            // ======= هنا نرجع الكائن للصفحة =======
                            // استدعاء الدالة من الـ Provider
                            Provider.of<CourseProvider>(
                              context,
                              listen: false,
                            ).addCourse(newCourse);

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: CustomText(
                                  text: 'تم حفظ المادة بنجاح',
                                  size: 17,
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
            ),
          );
        },
      );
    },
  );
}
