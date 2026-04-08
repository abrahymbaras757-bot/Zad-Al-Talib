import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/features/admin_dashboard/widgets/dashboard_card.dart';
import 'package:zad_altalib/providers/user_provider.dart';
import 'package:zad_altalib/shared/app_drawer.dart';
import 'package:zad_altalib/shared/custom_text.dart';
import 'package:zad_altalib/data/admin_data.dart';

// مكتمل
// صفحة لوحة التحكم الرئيسية
class AdminDashboardViews extends StatelessWidget {
  const AdminDashboardViews({super.key});

  @override
  Widget build(BuildContext context) {
    final data = getAdminData(context); // نحصل على القائمة المحدثة
    final userProvider = Provider.of<UserProvider>(context).currentUser;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      );
                    },
                  ),

                  CustomText(
                    text: 'لوحة التحكم',
                    size: 19,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: userProvider?.image != null
                          ? AssetImage(userProvider!.image!)
                          : AssetImage('assets/admin_1.jpg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(
        userName: userProvider?.name,
        image: userProvider?.image ?? 'assets/admin_1.jpg',
        userEmail: '${userProvider?.name}@gmail.com',
      ),

      body: Column(
        children: [
          SizedBox(height: 9),
          Padding(
            padding: const EdgeInsets.only(left: 150.0),
            child: CustomText(
              text: 'متابعة وإدارة النظام التعليمي',
              size: 20,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Divider(
            thickness: 1,
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = data[index];
                      return DashboardCard(
                        icon: item.icon,
                        title: item.title,
                        description: item.description,
                        count: item.count,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => item.page),
                          );
                        },
                        color: Colors.teal,
                      );
                    }, childCount: data.length),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
