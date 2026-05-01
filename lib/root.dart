import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zad_altalib/features/admin_dashboard/views/admin_dashboard_views.dart';
import 'package:zad_altalib/features/favorites/views/favorites_views.dart';
import 'package:zad_altalib/features/home/views/home_views.dart';
import 'package:zad_altalib/features/teacher_dashboard/views/teacher_dashboard_views.dart';
import 'package:zad_altalib/model/user_model.dart';

class Root extends StatefulWidget {
  final UserModel currentUser;
  const Root({super.key, required this.currentUser});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late PageController controller;
  // ignore: non_constant_identifier_names
  late List<Widget> screens_user;
  // ignore: non_constant_identifier_names
  late List<Widget> screens_teacher;
  // ignore: non_constant_identifier_names
  late List<Widget> screens_admin;
  int currentScreen = 0;

  @override
  void initState() {
    screens_user = [HomeViews(), FavoritesViews()];
    screens_teacher = [TeacherDashboardViews(currentUser: widget.currentUser)];
    screens_admin = [AdminDashboardViews()];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Scaffold(
          body: PageView(
            controller: controller,
            // ignore: sort_child_properties_last
            children: screens_user,
            physics: NeverScrollableScrollPhysics(),
          ),

          bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),

            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade500.withValues(alpha: 0.7),
              currentIndex: currentScreen,

              onTap: (index) {
                setState(() {
                  currentScreen = index;
                });
                controller.jumpToPage(currentScreen);
              },

              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'الرئيسية',
                ),

                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.star),
                  icon: Icon(Icons.star_border),
                  label: 'المفضلة',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
