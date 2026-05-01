import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/data/app_users.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/model/user_model.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/features/admin_dashboard/widgets/show_add_course_sheet.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';
import 'package:zad_altalib/shared/row_two_parts.dart';
import 'package:zad_altalib/shared/search.dart';

// مكتمل
// صفحة إدارة المواد
// ignore: must_be_immutable
class CoursesViews extends StatefulWidget {
  CoursesViews({super.key});
  CourseModel? courseModel;

  @override
  State<CoursesViews> createState() => _CoursesViewsState();
}

class _CoursesViewsState extends State<CoursesViews> {
  final TextEditingController nameController = TextEditingController();
  late TextEditingController serchController = TextEditingController();
  final List<UserModel> availableTeachers = appUsers
      .where((user) => user.role == UserRole.teacher)
      .toList();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final course = courseProvider.coursesList.where((cours) {
      return cours.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: CustomText(
              text: 'إدارة المواد',
              size: 19,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
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
                    controller: serchController,
                    onChanged: (v) {
                      setState(() {
                        query = v;
                      });
                    },
                    color: Colors.grey.shade900,
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: course.length,
                    itemBuilder: (context, index) {
                      final cours = course[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(1),
                          //border: Border.symmetric(horizontal: BorderSide()),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // القسم الاول ل الصوره فقط
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.tertiary,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: CircleAvatar(
                                      radius: 35,
                                      // ignore: unnecessary_string_interpolations
                                      foregroundImage: AssetImage(
                                        '${cours.image}',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // القسم الثاني يحتوي البيانات
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // العنوان
                                  RowTwoParts(
                                    titel: 'المادة :',
                                    text: cours.title,
                                  ),

                                  Row(
                                    children: [
                                      // عدد الملازم
                                      RowTwoParts(
                                        titel: 'عدد الملازم :',
                                        text: '${cours.pdfs.length}',
                                      ),
                                      SizedBox(width: 10),
                                      // عدد الفيديوهات
                                      RowTwoParts(
                                        titel: 'عدد الفيديوهات :',
                                        text: '${cours.videos.length}',
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              // القسم الثالث ل الايقونة
                              Container(
                                margin: EdgeInsets.only(bottom: 36),
                                child: PopupMenuButton<String>(
                                  icon: Icon(Icons.more_vert),
                                  // القائمة
                                  onSelected: (String value) {
                                    if (value == 'edit') {
                                      // كود التعديل
                                      TextEditingController titleController =
                                          TextEditingController(
                                            text: cours.title,
                                          );
                                      TextEditingController descController =
                                          TextEditingController(
                                            text: cours.description,
                                          );
                                      TextEditingController imageController =
                                          TextEditingController(
                                            text: cours.image,
                                          );

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (context, setDialogState) {
                                              return AlertDialog(
                                                title: CustomText(
                                                  text: 'تعديل المادة',
                                                  size: 18,
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.onSurface,
                                                ),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      CustomTextField(
                                                        hint: 'تعديل العنوان',
                                                        ispassword: false,
                                                        controller:
                                                            titleController,
                                                        sideColor: Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                        textColor: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                        hintColor: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                      ),
                                                      SizedBox(height: 5),
                                                      CustomTextField(
                                                        hint: 'تعديل الوصف',
                                                        ispassword: false,
                                                        controller:
                                                            descController,
                                                        sideColor: Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                        textColor: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                        hintColor: Theme.of(
                                                          context,
                                                        ).colorScheme.onSurface,
                                                      ),
                                                      SizedBox(height: 5),
                                                      ElevatedButton.icon(
                                                        onPressed: () async {
                                                          final ImagePicker
                                                          picker =
                                                              ImagePicker();

                                                          // اختيار الصوره من المعرض
                                                          XFile?
                                                          image = await picker
                                                              .pickImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery,
                                                              );
                                                          if (image != null) {
                                                            setDialogState(() {
                                                              // هنا تخزين المسار الجديد
                                                              imageController
                                                                      .text =
                                                                  image.path;
                                                            });
                                                          }
                                                        },
                                                        icon: Icon(Icons.image),
                                                        label: CustomText(
                                                          text:
                                                              'تغيير صورة المادة',
                                                          size: 18,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onSurface,
                                                        ),
                                                      ),
                                                      CustomText(
                                                        text:
                                                            imageController
                                                                .text
                                                                .isEmpty
                                                            ? 'لم يتم اختيار الصورة'
                                                            : 'تم اختيار الصورة بنجاح',
                                                        size: 13,
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CustomButton(
                                                        width: 120,
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                        text: 'حفظ التغييرات',
                                                        onTap: () {
                                                          // استدعاء دالة التعديل
                                                          courseProvider
                                                              .updateCourse(
                                                                cours.id,
                                                                titleController
                                                                    .text,
                                                                descController
                                                                    .text,
                                                                imageController
                                                                    .text,
                                                              );

                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                      ),
                                                      CustomButton(
                                                        width: 100,
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.tertiary,
                                                        text: 'الغاء',
                                                        onTap: () =>
                                                            Navigator.pop(
                                                              context,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      );
                                    } else if (value == 'delete') {
                                      // كود الحذف
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: CustomText(
                                              text:
                                                  'هل انت متأكد من حذف مادة ${cours.title} لا يمكن التراجع عن هاذا الأجراء ؟',
                                              size: 17,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onSurface,
                                              maxLines: 2,
                                            ),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  CustomButton(
                                                    width: 100,
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.tertiary,
                                                    text: 'موافق',
                                                    onTap: () {
                                                      courseProvider
                                                          .deleteCourse(
                                                            cours.id,
                                                          );
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  CustomButton(
                                                    width: 100,
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.tertiary,
                                                    text: 'الغاء',
                                                    onTap: () =>
                                                        Navigator.pop(context),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  itemBuilder: (context) => [
                                    PopupMenuItem<String>(
                                      value: 'edit',
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                        title: CustomText(
                                          text: 'تعديل المادة',
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                    //
                                    PopupMenuItem<String>(
                                      value: 'delete',
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        title: CustomText(
                                          text: 'حذف المادة',
                                          size: 17,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),

          // زر اضافة ماده
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showAddCourseSheet(context, availableTeachers);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
