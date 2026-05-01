import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/data/dummy_data.dart';
import 'package:zad_altalib/model/course_model.dart';
import 'package:zad_altalib/features/pdf_viewer/views/pdf_viewer_views.dart';
import 'package:zad_altalib/features/subject_content/widgets/card_subject.dart';
import 'package:zad_altalib/model/review_model.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/review_provider.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zad_altalib/shared/custom_text_field.dart';

// صفحة عرض المادة
class SubjectContentViews extends StatefulWidget {
  //final CourseModel course;
  final String courseId;
  const SubjectContentViews({super.key, required this.courseId});

  @override
  State<SubjectContentViews> createState() => _SubjectContentViewsState();
}

class _SubjectContentViewsState extends State<SubjectContentViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  CourseModel? course;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // نأخذ الكورس من Provider بعد build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CourseProvider>(context, listen: false);
      final fetchedCourse = provider.getCourseById(widget.courseId);
      if (fetchedCourse != null) {
        setState(() {
          course = fetchedCourse;
        });
      }
    });
  }

  // دالة لفتح رابط اليوتيوب
  Future<void> openYouTubeLink(String link) async {
    final uri = Uri.parse(link);

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('تعذر فتح الرابط')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);
    final reviewProvider = Provider.of<ReviewProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    // تحقق هل الطالب قيم المادة من قبل
    final userReview = reviewProvider.getUserReview(
      userProvider.currentUser!.id,
      courseProvider.getCourseById(widget.courseId)!.id,
    );
    final theme = Theme.of(context);
    if (course == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('تحميل المادة...')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,

            // زر الرجوع (يسار)
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

            title: CustomText(
              text: course!.title,
              size: 23,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(course!.image),
                ),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              labelColor: Theme.of(
                context,
              ).colorScheme.inversePrimary, // لون التبويب عند التحديد
              unselectedLabelColor:
                  Colors.grey.shade600, // لون التبويب غير المحدد
              indicatorColor: Theme.of(
                context,
              ).colorScheme.secondary, // لون الخط تحت التبويب
              indicatorWeight: 4, // سمك الخط تحت التبويب
              tabs: [
                Tab(text: 'PDF ${course!.pdfs.length}'),
                Tab(text: 'YouTube ${course!.videos.length}'),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: Column(
            children: [
              // قسم التقييم للمادة الحالية
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50,
                  width: userReview == null ? double.infinity : 240,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: theme.colorScheme.tertiary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // متوسط التقييم وعدد التقييمات
                        CustomText(
                          text:
                              ' التقييم: ⭐ ${reviewProvider.getCourseAverageRating(course!.id).toStringAsFixed(1)}',
                          size: 15,
                          color: theme.colorScheme.inversePrimary,
                        ),
                        CustomText(
                          text:
                              'عدد التقييمات ${reviewProvider.getCourseReviews(course!.id).length}',
                          size: 16,
                          color: theme.colorScheme.inversePrimary,
                        ),

                        // زر إضافة تقييم
                        if (userReview == null)
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                (states) => theme.colorScheme.outline,
                              ),
                            ),
                            onPressed: () async {
                              final TextEditingController comment =
                                  TextEditingController();
                              int? rating = await showDialog<int>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: CustomText(
                                    text: 'قيّم المادة',
                                    size: 22,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      //
                                      CustomTextField(
                                        hint: 'اضف تعليق',
                                        ispassword: false,
                                        controller: comment,
                                        sideColor: theme.colorScheme.tertiary,
                                        textColor: theme.colorScheme.onSurface,
                                        hintColor: theme.colorScheme.onSurface,
                                        maxLines: 2,
                                      ),
                                      // Rating Comment
                                      SizedBox(height: 5),
                                      Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(5, (index) {
                                              return IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                                icon: Icon(
                                                  Icons.star_border,
                                                  color: Colors.amber,
                                                  size: 26,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(
                                                    context,
                                                  ).pop(index + 1);
                                                },
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );

                              if (rating != null) {
                                // إنشاء ReviewModel جديد
                                final newReview = ReviewModel(
                                  id: DateTime.now().millisecondsSinceEpoch
                                      .toString(),
                                  courseId: course!.id,
                                  userId: userProvider.currentUser!.id
                                      .toString(), // استبدل بالـ id الحقيقي للمستخدم
                                  comment: comment.text ?? '',
                                  date: DateTime.now(),
                                  rating: rating,
                                  isApproved: true,
                                );

                                reviewProvider.addReview(newReview);
                              }
                            },
                            icon: Icon(
                              Icons.rate_review,
                              color: theme.colorScheme.onSurface,
                            ),
                            label: CustomText(
                              text: 'أضف تقييم',
                              size: 14,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // محتوى الـ TabBarView
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // محتوى ال PDF
                    ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      itemCount: course!.pdfs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PdfViewerViews(
                                  title: course!.pdfs[index].title,
                                  assetPath: course!.pdfs[index].filePath,
                                ),
                              ),
                            );
                          },
                          child: CardSubject(
                            title: course!.pdfs[index].title,
                            icontitle: Icons.picture_as_pdf,
                            icon: Icons.downloading_rounded,
                          ),
                        );
                      },
                    ),
                    // محتوى ال YouTube
                    ListView.builder(
                      itemCount: course!.videos.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          // عند الضغط على رابط اليوتيوب، يتم فتحه في المتصفح الخارجي
                          onTap: () {
                            openYouTubeLink(course!.videos[index].link);
                          },
                          child: CardSubject(
                            title: course!.videos[index].title,
                            icontitle: Icons.video_library,
                            text: course!.videos[index].link,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
