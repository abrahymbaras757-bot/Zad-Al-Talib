import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_altalib/core/themes/theme_provider.dart';
import 'package:zad_altalib/features/auth/views/login_views.dart';
import 'package:zad_altalib/features/auth/widgets/custom_button.dart';
import 'package:zad_altalib/shared/custom_text.dart';

// قائمة جانبية
class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.userName,
    required this.image,
    this.userEmail,
  });
  final String? userName;
  final String? userEmail;
  final String? image;
  String get displayEmail => (userEmail != null && userEmail!.isNotEmpty)
      ? userEmail!
      : 'user@gmail.com';
  String get displayName =>
      (userName != null && userName!.isNotEmpty) ? userName! : 'Hello User';
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  // هنا فحص الصوره اذا موجود صوره للعميل يستخدمها واذا لا يستخدم صوره افتراضية
                  backgroundImage: (image != null && image!.isNotEmpty)
                      ? AssetImage(image!)
                      : AssetImage('assets/c++.jpg'),
                  radius: 27,
                ),
                SizedBox(height: 12),
                CustomText(
                  text: displayName,
                  size: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                SizedBox(height: 4),
                CustomText(
                  text: displayEmail,
                  size: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.translate),
            title: CustomText(text: 'اللغة', size: 19),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: CustomText(text: 'المطورين', size: 19),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      title: CustomText(text: 'فريق التطوير', size: 19),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'تم تطوير هاذا التطبيق بواسطة :',
                                size: 17,
                              ),
                              Row(
                                children: [
                                  CustomText(text: 'المطور : ', size: 17),
                                  CustomText(text: 'محسن العتيقي', size: 17),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomText(text: 'المطور : ', size: 17),
                                  CustomText(text: 'سالم اليسلمي', size: 17),
                                ],
                              ),
                              Row(
                                children: [
                                  CustomText(text: 'المطور : ', size: 17),
                                  CustomText(text: 'ابراهيم باراس', size: 17),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Divider(),
          SwitchListTile(
            secondary: Icon(Icons.dark_mode),
            title: CustomText(text: 'الوضع المظلم', size: 19),
            value: themeProvider.isDarkMode,
            onChanged: (v) {
              themeProvider.toggleTheme(v);
            },
          ),
          SizedBox(height: 290),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: CustomText(text: 'تسجيل خروج', size: 19),
            onTap: () {
              // اجراءت تسجيل الخروج
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: CustomText(
                        text: 'هل انت متاكد من هاذا الاجراء؟',
                        size: 19,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          width: 100,
                          color: Theme.of(context).colorScheme.tertiary,
                          text: 'الغاء',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          width: 100,
                          color: Theme.of(context).colorScheme.tertiary,
                          text: 'موافق',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginViews()),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
