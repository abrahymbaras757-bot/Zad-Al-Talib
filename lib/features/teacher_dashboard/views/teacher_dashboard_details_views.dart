import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/features/teacher_dashboard/widgets/Custom_radio.dart';
import 'package:zad_altalib/features/teacher_dashboard/widgets/add_pdv_and_youtube.dart';
import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';
import 'package:zad_altalib/shared/enums/ContentType.dart';
import 'package:file_picker/file_picker.dart';

// صفحة إضافة محتوى خاصة بالمادة
class TeacherDashboardDetailsViews extends StatefulWidget {
  final CourseModel course;
  const TeacherDashboardDetailsViews({super.key, required this.course});

  @override
  State<TeacherDashboardDetailsViews> createState() =>
      _TeacherDashboardDetailsViewsState();
}

class _TeacherDashboardDetailsViewsState
    extends State<TeacherDashboardDetailsViews> {
  final GlobalKey<FormState> _globalKey = GlobalKey();
  late TextEditingController titlePdfController;
  late TextEditingController titleYoutubeController;
  late TextEditingController linkYoutubeController;
  ContentType? _selectdContentType;
  String? pdfPath;
  // داله اعطا قيمة للحقول لتجنب الاخطاء
  @override
  void initState() {
    super.initState();
    titlePdfController = TextEditingController();
    titleYoutubeController = TextEditingController();
    linkYoutubeController = TextEditingController();
  }

  @override
  void dispose() {
    titlePdfController.dispose();
    titleYoutubeController.dispose();
    linkYoutubeController.dispose();
    super.dispose();
  }

  // داله لاضافة محتوى PDF
  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        pdfPath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              backgroundColor: Theme.of(context).colorScheme.primary,
              actions: [
                CustomText(
                  text: widget.course.title,
                  size: 19,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                SizedBox(width: 120),
                CircleAvatar(backgroundImage: AssetImage(widget.course.image)),
                SizedBox(width: 10),
              ],
            ),

            body: SingleChildScrollView(
              child: Form(
                key: _globalKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 200.0,
                          top: 10,
                          right: 5,
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomText(
                            text: 'إضافة محتوى جديد',
                            size: 19,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                      Divider(),
                      // Radio
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            children: [
                              CustomText(
                                text: 'اختر النوع',
                                size: 18,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              // RadioPDF
                              Expanded(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: CustomRadio(
                                    title: 'PDF',
                                    value: ContentType.pdf,
                                    groupValue: _selectdContentType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectdContentType = value;
                                      });
                                    },
                                    titleColor: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                              // RadioYotTube
                              Expanded(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: CustomRadio(
                                    title: 'فيديو',
                                    value: ContentType.youtube,
                                    groupValue: _selectdContentType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectdContentType = value;
                                      });
                                    },
                                    titleColor: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // اذا كان ال Radio محدد على Pdf
                      if (_selectdContentType == ContentType.pdf)
                        Column(
                          children: [
                            Divider(),
                            CustomText(
                              text: 'PDF',
                              size: 19,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: 'ادخل عنوان المحتوى',
                              size: 17,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 5,
                              ),
                              child: CustomTextField(
                                hint: 'اضف عنوان محتوى pdf',
                                ispassword: false,
                                controller: titlePdfController,
                                sideColor: Theme.of(
                                  context,
                                ).colorScheme.tertiary,
                                hintColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: 'أختر الملف المطلوب',
                              size: 17,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 5),
                            CustomButton(
                              width: 200,
                              color: Theme.of(context).colorScheme.tertiary,
                              text: 'إرفاق ملف PDF',
                              onTap: () async {
                                await pickPdf();
                              },
                            ),
                            SizedBox(height: 200),
                            CustomButton(
                              width: 360,
                              color: Theme.of(context).colorScheme.tertiary,
                              text: 'إضافة محتوى PDF',
                              onTap: () {
                                addPdfContent(
                                  context: context,
                                  courseId: widget.course.id,
                                  pdfTitle: titlePdfController.text,
                                  pdfPath: pdfPath!,
                                );
                              },
                            ),
                          ],
                        ),

                      // اذا كان ال Radio محدد على Youtub
                      if (_selectdContentType == ContentType.youtube)
                        Column(
                          children: [
                            Divider(),
                            CustomText(
                              text: 'YouTube',
                              size: 19,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: 'ادخل عنوان المحتوى',
                              size: 17,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 5,
                              ),
                              child: CustomTextField(
                                hint: 'اضف عنوان محتوى youtube',
                                ispassword: false,
                                controller: titleYoutubeController,
                                sideColor: Theme.of(
                                  context,
                                ).colorScheme.tertiary,
                                hintColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                                textColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomText(
                              text: 'أضف الرابط في الحقل',
                              size: 17,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 5,
                              ),
                              child: CustomTextField(
                                hint: 'إرفاق محتوى ال YotTube',
                                ispassword: false,
                                controller: linkYoutubeController,
                                sideColor: Theme.of(
                                  context,
                                ).colorScheme.tertiary,
                                hintColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                                textColor: Theme.of(
                                  context,
                                ).colorScheme.onSurface,
                              ),
                            ),
                            SizedBox(height: 50),
                            CustomButton(
                              width: 200,
                              color: Theme.of(context).colorScheme.tertiary,
                              text: 'إضافة رابط YouTube',
                              onTap: () {
                                addYoutubeContent(
                                  context: context,
                                  courseId: widget.course.id,
                                  title: titleYoutubeController.text,
                                  link: linkYoutubeController.text,
                                );
                                titleYoutubeController.clear();
                                linkYoutubeController.clear();
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
