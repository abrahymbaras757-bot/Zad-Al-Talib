import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/providers/course_provider.dart';
import 'package:zad_altalib/providers/review_provider.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/app_drawer.dart';
import 'package:zad_altalib/features/home/widgets/card_material.dart';
import 'package:zad_altalib/shared/search.dart';
import 'package:zad_altalib/features/subject_content/views/subject_content_views.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/shared/search.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  late TextEditingController searchController;
  String query = '';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final reviweProvider = Provider.of<ReviewProvider>(context);
    final currentUser = userProvider.currentUser;
    final courseProvider = Provider.of<CourseProvider>(context);
    // للبحث عن المادة من خلال العنوان
    final courses = courseProvider.coursesList
        .where((c) => c.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    final theme = Theme.of(context);
    // ==============
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: theme.colorScheme.surface,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: theme.colorScheme.primary,
              actions: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // اظهار الايقونة من اليمين مع فتح القائمة الجانبية
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: theme.colorScheme.inversePrimary,
                            ),
                          ),
                        ),

                        CustomText(
                          text: ' الرائيسية ',
                          size: 20,
                          weight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        // صورة المستخدم
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: currentUser?.image != null
                                ? AssetImage(currentUser!.image!)
                                : AssetImage('assets/student_1.png'),
                            backgroundColor: Colors.green.shade100,
                            radius: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              //=======================
            ),
            drawer: AppDrawer(
              userName: currentUser?.name,
              image: currentUser?.image ?? 'assets/student_1.png',
              // ignore: dead_null_aware_expression
              userEmail: '${currentUser?.name}@gmail.com',
            ),

            //======================
            body: Column(
              children: [
                // Containar Card
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.tertiary,
                          Theme.of(context).colorScheme.primary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(55),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // image
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),

                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/zad.png'),
                              backgroundColor: Colors.transparent,
                              radius: 43,
                            ),
                          ),
                          // Column
                          Column(
                            children: [
                              SizedBox(height: 10),
                              CustomText(
                                text: 'مرحباً ${currentUser?.name}',
                                size: 22,
                                weight: FontWeight.bold,
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                              ),
                              SizedBox(height: 5),
                              CustomText(
                                text: 'اختر المادة المناسبة لك بسهولة',
                                size: 16,
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                              ),
                              SizedBox(height: 10),
                              // Row
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: theme.colorScheme.tertiary,
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.colorScheme.onSurface,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text:
                                                'المواد ${courseProvider.coursesList.length}',
                                            size: 17,
                                            weight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.inversePrimary,
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.menu_book_sharp,
                                            color: theme
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          CustomText(
                                            text:
                                                'المفضلة ${courseProvider.favoriteCourses.length}',
                                            size: 17,
                                            weight: FontWeight.bold,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.inversePrimary,
                                          ),
                                          SizedBox(width: 4),
                                          Icon(
                                            Icons.star,
                                            color: theme
                                                .colorScheme
                                                .inversePrimary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //search=======================
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Search(
                    hintText: 'ابحث عن المادة',
                    controller: searchController,
                    onChanged: (v) {
                      setState(() {
                        query = v;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      CustomText(
                        text: 'المواد المتاحة',
                        weight: FontWeight.bold,
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      SizedBox(width: 130),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiary.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 4,
                            ),
                            child: CustomText(
                              text: 'المواد : ${courses.length}',
                              size: 17,
                              weight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // card
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        sliver: SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.55,
                                //crossAxisSpacing: 1.0,
                              ),
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final data = courses[index];
                            final review =
                                reviweProvider
                                    .getCourseAverageRating(data.id)
                                    .toStringAsFixed(1) ??
                                '0.0';
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        SubjectContentViews(courseId: data.id),
                                  ),
                                );
                              },
                              child: CardMaterial(
                                image: data.image,
                                title: data.title,
                                description: data.description,
                                rating: review,
                                sumPdf: data.pdfs.length,
                                sumYoutube: data.videos.length,
                                nameTeacher: data.teacherName,
                                course: data,
                                onPressed: () {
                                  courseProvider.toggleFavorite(data);
                                },
                              ),
                            );
                          }, childCount: courses.length),
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
    );
  }
}
